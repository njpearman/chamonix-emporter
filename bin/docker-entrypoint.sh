#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
   echo "Found PID file so deleting"
   rm tmp/pids/server.pid
fi

exec "$@"
