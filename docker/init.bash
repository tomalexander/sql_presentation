#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

/usr/bin/postgres -D /var/lib/postgresql/data &
PGPID=$!

sleep 2
/usr/bin/psql -f /var/lib/postgresql/initial_schema.sql

kill -SIGTERM "$PGPID"
wait
