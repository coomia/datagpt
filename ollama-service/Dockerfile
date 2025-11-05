FROM ollama/ollama:0.9.2

WORKDIR /app

COPY start.sh .
RUN chmod +x start.sh

# 安装 dos2unix 和 net-tools
RUN apt-get update && apt-get install -y dos2unix net-tools curl && dos2unix start.sh && \
    mkdir -p /root/.ollama/models && \
    chmod -R 777 /root/.ollama

# 设置入口点
ENTRYPOINT ["/bin/sh", "-c"]