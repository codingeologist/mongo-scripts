#!/bin/bash

DB_PORT="$1"
DB_HOST="$2"
DB_NAME="$3"

docker pull mongo:latest
echo "refreshing localhost mongo development instance"
docker run --rm -p $DB_PORT:$DB_PORT --name local-mongodb mongo:latest

echo "connecting to mongodb $DB_NAME"
mongosh --host $DB_HOST --port $DB_PORT $DB_NAME
