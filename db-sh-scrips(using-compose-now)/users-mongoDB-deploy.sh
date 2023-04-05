#!/bin/bash
set -e
PORT=27017
DB_NAME="users_dev"
DB_USER="user" #secret
DB_PASSWORD="password" #secret

# Run container
docker run \
  --name users-db-mongo\
  --rm \
  -d \
  -d \
  -p $PORT:27017 \
  -e MONGO_INITDB_DATABASE="${DB_NAME}" \
  -e MONGO_INITDB_ROOT_USERNAME="${DB_USER}" \
  -e MONGO_INITDB_ROOT_PASSWORD="${DB_PASSWORD}" \
  --network test \
  mongo

#Verify
docker ps
