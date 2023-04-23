#!/bin/bash
source .env

set -e
#General configs
NODE_ENV="development" #change in production
PORT=3001

#Postgre configs
POSTGRES_USER="transactions50adminTransactions" #secret
PGHOST="transactions-db-posgres"
PGPORT=5433
PGPASSWORD="RabbitMQconfigurationbypullingfromthesystem#Transactions" #secret


#Consul setting
CONSUL_SERVICE_NAME="transactions"
CONSUL_HOST="consul-client" #change in production
CONSUL_PORT=8500


# RabbitMQ configs
AMQPPORT=5672

docker run \
  --name transactions-service\
  --rm \
  -it \
  -e NODE_ENV="${NODE_ENV}" \
  -e PORT="${PORT}" \
  -e PGUSER="${POSTGRES_USER}" \
  -e PGHOST="${PGHOST}" \
  -e PGPORT="${PGPORT}" \
  -e PGPASSWORD="${PGPASSWORD}" \
  -e CONSUL_SERVICE_NAME="${CONSUL_SERVICE_NAME}" \
  -e CONSUL_HOST="${CONSUL_HOST}" \
  -e CONSUL_PORT="${CONSUL_PORT}" \
  -e AMQPPORT="${AMQPPORT}" \
  -e AMQPHOST="${AMQPHOST}" \
  -p $PORT:3001 \
  --network test \
  transactions-express