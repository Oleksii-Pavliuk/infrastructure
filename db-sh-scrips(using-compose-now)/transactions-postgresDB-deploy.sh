#!/bin/bash
set -e
PORT=5433
POSTGRES_USER="transactions50adminTransactions" #secret
POSTGRES_PASSWORD="RabbitMQconfigurationbypullingfromthesystem#Transactions" #secret
DB_NAME='transactions'


# Run
docker run \
  --name transactions-db \
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


# Copy transactions-schema.sql file to container
docker cp transactions-schema.sql transactions-db:/tmp/
sleep 5

docker exec -it transactions-db   createdb -U ${POSTGRES_USER} ${DB_NAME}
docker exec -it transactions-db psql -U ${POSTGRES_USER} ${DB_NAME} -a -f ./tmp/transactions-schema.sql

# Remove transactions-schema.sql file from container
docker exec -i transactions-db rm /tmp/transactions-schema.sql