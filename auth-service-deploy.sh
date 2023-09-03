#!/bin/bash
source .env

set -e
CONSUL_HOST=consul-client #change in production
CONSUL_PORT=8500 
JAEGER_HOST="jaeger"
JAEGER_PORT=4317
SERVICE_NAME='Authentication Service'
SERVICE_PORT=8000
DB_NAME='usersPostgres'  #change in production
DB_HOST='users-db-postgres' #change in production
DB_PORT=5432
DB_USER="transactions50adminUsers" #secret
DB_PASSWORD="RabbitMQconfigurationbypullingfromthesystem#Users" #secret
KEY=${DJANGO_KEY}
DJANGO_DEBUG_BOOLEAN=False
SERVICE_HOST="*" #change in production


# Run
docker run \
  --name auth-service \
  --rm \
  -d \
  -e CONSUL_HOST="${CONSUL_HOST}" \
  -e CONSUL_PORT=${CONSUL_PORT} \
  -e JAEGER_HOST=${JAEGER_HOST} \
  -e JAEGER_PORT=${JAEGER_PORT} \
  -e SERVICE_PORT=${SERVICE_PORT} \
  -e SERVICE_NAME="${SERVICE_NAME}" \
  -e SERVICE_HOST="${SERVICE_HOST}" \
  -e KEY="${KEY}" \
  -e DJANGO_DEBUG_BOOLEAN=${DJANGO_DEBUG_BOOLEAN} \
  -e DB_NAME="${DB_NAME}" \
  -e DB_HOST="${DB_HOST}" \
  -e DB_PORT="${DB_PORT}" \
  -e DB_USER="${DB_USER}" \
  -e DB_PASSWORD="${DB_PASSWORD}" \
  -p ${SERVICE_PORT}:8000 \
  --network test \
  authentication-django


#Verify
docker ps
