#!/usr/bin/env bash

TARGET="$1"

if [ -z "$TARGET" ]; then
  echo 'Usage: persist ./path/to/target'
  exit 1
fi

DIR="$(dirname "$TARGET")"

mkdir -p "/persist/${DIR}" >/dev/null 2>&1

# Avoid permissions issues
DETAILS="$(ls -ld "$DIR")"
OWNER="$(awk 'BEGIN{OFS=":"} { print $3,$4; }' <<<"$DETAILS")"

chown "$OWNER" "/persist/${DIR}"

if [ -d "$TARGET" ]; then
  cp -a "${TARGET}/." "/persist/${TARGET}"
else
  mv "$TARGET" "/persist/${DIR}/"
fi

