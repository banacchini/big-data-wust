#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <command>" >&2 #stderr output, $0 to nazwa skryptu
  exit 1
fi

bash -c "$1" &
echo "started background process with PID $!"