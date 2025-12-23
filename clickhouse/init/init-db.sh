#!/bin/bash
set -e

echo "等待 ClickHouse 服务器完全启动..."

until clickhouse-client --query "SELECT 1" >/dev/null 2>&1; do
  echo "ClickHouse 还在启动中，等待 2 秒..."
  sleep 2
done

echo "ClickHouse 已就绪，可以执行初始化 SQL 了"