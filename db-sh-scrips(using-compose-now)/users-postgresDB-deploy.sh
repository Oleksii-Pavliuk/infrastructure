#!/bin/bash
set -e
PORT=5432
POSTGRES_USER="transactions50adminUsers" #secret
POSTGRES_PASSWORD="RabbitMQconfigurationbypullingfromthesystem#Users" #secret
DB_NAME='usersPostgres'


# Run
docker run \
  --name users-db-postgres \
  --rm \
  -d \
  -e POSTGRES_USER="${POSTGRES_USER}" \
  -e PGPORT="${PORT}" \
  -e POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" \
  -p ${PORT}:5432 \
  --network test \
  postgres

#Verify
docker ps

# Uncomment this if you need to create a database(running for first time)
sleep 5
docker exec -it users-db-postgres   createdb -U ${POSTGRES_USER} ${DB_NAME}