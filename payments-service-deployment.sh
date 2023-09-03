#!/bin/bash
source .env

set -e
#General configs
NODE_ENV="development" #change in production
PORT=3002

#Redis config
REDIS_STRING="redis://users-redis:6379" #secret


#Consul setting
CONSUL_SERVICE_NAME="Payments Service"
CONSUL_HOST="consul-client" #change in production
CONSUL_PORT=8500


# RabbitMQ configs
AMQPPORT=5672
AMQPHOST="rabbitmq"

docker run \
  --name payments-service\
  --rm \
  -it \
  -e NODE_ENV="${NODE_ENV}" \
  -e PORT="${PORT}" \
  -e REDIS_STRING="${REDIS_STRING}" \
  -e CONSUL_SERVICE_NAME="${CONSUL_SERVICE_NAME}" \
  -e CONSUL_HOST="${CONSUL_HOST}" \
  -e CONSUL_PORT="${CONSUL_PORT}" \
  -e AMQPPORT="${AMQPPORT}" \
  -e AMQPHOST="${AMQPHOST}" \
  -p $PORT:3002 \
  --network test \
  payments-express