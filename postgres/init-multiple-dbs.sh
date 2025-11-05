#!/bin/sh
set -e

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
  echo "Multiple databases creation requested: $POSTGRES_MULTIPLE_DATABASES"
  for db in $POSTGRES_MULTIPLE_DATABASES; do
    echo "Creating database: $db"
    psql -v ON_ERROR_STOP=1 \
         --username "$POSTGRES_USER" \
         --dbname "$POSTGRES_DB" <<-EOSQL
      CREATE DATABASE "$db";
EOSQL
  done
  echo "Databases created successfully!"
fi
