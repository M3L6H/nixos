#!/usr/bin/env sh

INSOMNIA="$([ -f "$HOME/.local/state/no-suspend" ] && echo 'true' || echo 'false')"

# Don't lock while I'm trying to rebuild
touch "$HOME/.local/state/no-lock"

# Don't suspend while I'm trying to rebuild
touch "$HOME/.local/state/no-suspend"

sudo nixos-rebuild-ng switch --flake /etc/nixos#nixos "$@" |& tee /tmp/build.log

if ! "$INSOMNIA"; then
  rm -f "$HOME/.local/state/no-suspend"
fi

rm -f "$HOME/.local/state/no-lock"
