#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <command>" >&2
  exit 1
fi

pids=$(pgrep -u "$UID" -fx "$1") # -u match by effective id, -f match by full process name, -x match by exact process name


if [ -z "$pids" ]; then
  echo "No process found for command: $1" >&2
  exit 1
fi

kill $pids # bez "" żeby bash mógł rozbić PIDy na osobne argumenty (pgrep zwraca je w jednej linii, a kill wymaga osobnych argumentów)
echo "$pids terminated"
