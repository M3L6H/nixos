#!/bin/sh

if [ -f "${HOME}/.local/state/no-suspend" ]; then
  echo 'Suspend disabled'
else
  systemctl suspend
fi
