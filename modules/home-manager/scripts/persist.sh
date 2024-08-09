#!/usr/bin/env bash

TARGET="$1"

if [ -z "$TARGET" ]; then
  echo 'Usage: persist ./path/to/target'
  exit 1
fi

DIR="$(dirname "$TARGET")"

mkdir -p "/persist/${DIR}" >/dev/null 2>&1

mv "$TARGET" "/persist/${DIR}/"

