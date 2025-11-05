#!/bin/sh
set -e

# 确保模型存储目录存在
mkdir -p /root/.ollama/models
chmod -R 777 /root/.ollama

# 启动 ollama serve
ollama serve &

# 等待 ollama 服务启动
timeout=30
elapsed=0
while ! netstat -tuln | grep -q ":11434"; do
  if [ $elapsed -ge $timeout ]; then
    echo "Error: ollama service did not start within $timeout seconds"
    exit 1
  fi
  echo "Waiting for ollama service to start..."
  sleep 1
  elapsed=$((elapsed + 1))
done
echo "Ollama service is running"

# 拉取或创建模型
MODELS="nomic-embed-text bge-small-en-v1.5"
for MODEL in ${MODELS}; do
  echo "Processing model: $MODEL"
  if ollama list | grep -q "$MODEL"; then
    echo "Model $MODEL already exists, skipping"
  elif ollama pull "$MODEL"; then
    echo "Successfully pulled model: $MODEL"
  else
    echo "Failed to pull model: $MODEL, attempting to create"
    ollama create "$MODEL" -f "/app/Modelfile_$MODEL" || echo "Failed to create model: $MODEL, continuing"
  fi
done

# 验证模型文件
ls -la /root/.ollama/models

# 前台保持运行
wait