#!/usr/bin/env sh

if [ -f "${HOME}/.local/state/no-lock" ]; then
  echo 'Lock disabled'
else
  loginctl lock-session
fi
