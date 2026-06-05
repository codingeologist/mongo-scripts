#!/bin/bash

DB_HOST="$1"
DB_PORT="$2"
DB_NAME="$3"
COLL_NAME="$4"
INPUT_FILE="$5"

echo "Connect to MongoDB create $DB_NAME db and $COLL_NAME collection if does not exist"
mongosh --host $DB_HOST --port $DB_PORT $DB_NAME << EOF
    use $DB_NAME;
    db.createCollection("$COLL_NAME");
EOF

echo "Import data from $INPUT_FILE to $DB_NAME/$COLL_NAME"
mongoimport --host $DB_HOST --port $DB_PORT --db $DB_NAME --collection $COLL_NAME --file $INPUT_FILE --jsonArray
