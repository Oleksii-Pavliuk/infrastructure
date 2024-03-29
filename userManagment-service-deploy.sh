#!/bin/bash
source .env

set -e
#General configs
NODE_ENV="development" #change in production
PORT=3000
JWT_KEY="development-jwt-key" #secret, change in production(use open ssl)

#Postgre configs
POSTGRES_USER="transactions50adminTransactions" #secret
PGHOST="transactions-db-posgres"
PGPORT=5433
PGPASSWORD="RabbitMQconfigurationbypullingfromthesystem#Transactions" #secret


#Mongodb configs
MONGOSTRING="mongodb://users-db-mongo:27017/users_dev" #secret
MONGOUSER="user" #secret
MONGOPASSWORD="password" #secret

#Redis config
REDIS_STRING="redis://users-redis:6379"


#Consul setting
CONSUL_SERVICE_NAME="Users Managment Service"
CONSUL_HOST="consul-client" #change in production
CONSUL_PORT=8500


# Auth service configurations (django rest app for authentication)
AUTH_API_KEY=${AUTH_API_KEY}  #secret, specify each run (instructions in auth app readme)

# RabbitMQ configs
AMQPPORT=5672
AMQPHOST="rabbitmq"

docker run \
  --name users-managment-service\
  --rm \
  -it \
  -e NODE_ENV="${NODE_ENV}" \
  -e PORT="${PORT}" \
  -e JWT_KEY="${JWT_KEY}" \
  -e PGUSER="${POSTGRES_USER}" \
  -e PGHOST="${PGHOST}" \
  -e PGPORT="${PGPORT}" \
  -e PGPASSWORD="${PGPASSWORD}" \
  -e MONGOSTRING="${MONGOSTRING}" \
  -e MONGOUSER="${MONGOUSER}" \
  -e MONGOPASSWORD="${MONGOPASSWORD}" \
  -e REDIS_STRING="${REDIS_STRING}" \
  -e CONSUL_SERVICE_NAME="${CONSUL_SERVICE_NAME}" \
  -e CONSUL_HOST="${CONSUL_HOST}" \
  -e CONSUL_PORT="${CONSUL_PORT}" \
  -e AUTH_API_KEY="${AUTH_API_KEY}" \
  -e AMQPPORT="${AMQPPORT}" \
  -e AMQPHOST="${AMQPHOST}" \
  -p $PORT:3000 \
  --network test \
  user-managment-express

#Verify
docker ps