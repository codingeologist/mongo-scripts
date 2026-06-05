#!/bin/bash

DB_HOST="$1"
DB_PORT="$2"
DB_NAME="$3"
COLL_NAME="$4"
OUTPUT_FILE="$5"
URI="$DB_HOST:$DB_PORT"

echo "Export data to $OUTPUT_FILE from $DB_NAME/$COLL_NAME"
mongoexport --host $URI --db $DB_NAME --collection $COLL_NAME --out $OUTPUT_FILE --jsonArray --pretty
