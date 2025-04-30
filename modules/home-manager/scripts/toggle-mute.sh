#!/usr/bin/env sh

DIR="${HOME}/.local/share/state/playerctl"

ctl="$(which playerctl)"

if [ $? -ne 0 ]; then
  echo 'No playerctl found'
  exit 1
fi

2>&1 mkdir -p "$DIR" >/dev/null

if [ -f "${DIR}/last-volume" ]; then
  playerctl volume "$(cat "${DIR}/last-volume")"
  rm "${DIR}/last-volume"
else
  playerctl volume > "${DIR}/last-volume"
  playerctl volume 0
fi
