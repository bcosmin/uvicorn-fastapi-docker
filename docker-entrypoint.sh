#!/bin/sh
set -eu

# Entrypoint that runs the default uvicorn server when no command is
# provided, otherwise execs the provided command so signals are forwarded.

if [ "$#" -eq 0 ]; then
  echo "No command provided — starting default uvicorn server" >&2
  exec uvicorn app.main:app --host 0.0.0.0 --port 8000
else
  exec "$@"
fi
