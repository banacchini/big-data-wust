#!/bin/sh
echo "$GREETING"
cat "${1:-/app/banner.txt}"
echo "Autor: $AUTHOR"