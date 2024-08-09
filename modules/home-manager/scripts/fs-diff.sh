#!/usr/bin/env bash
# Taken from https://mt_caret.github.io/blog/posts/2020-06-29-optin-state.html
# Usage: fs-diff /mnt/@home true

VOLUME="${1:-/mnt/@}"

OLD_TRANSID="$(btrfs subvolume find-new "${VOLUME}-blank" 9999999)"
OLD_TRANSID="${OLD_TRANSID#transid marker was }"

new_diff="/persist/$(basename "$VOLUME")-new-diff"

[ -f "$new_diff" ] && rm "$new_diff"

btrfs subvolume find-new "$VOLUME" "$OLD_TRANSID" |
sed '$d' |
cut -f17- -d' ' |
sort |
uniq |
while read path; do
  path="/${path}"
  if [ -L "$path" ]; then
    : # Ignore symbolic links, since they are likely from nixos anyway
  elif [ -d "$path" ]; then
    : # Ignore directories
  else
    echo "$path"
  fi
done > "$new_diff"

old_diff="/persist/$(basename "$VOLUME")-old-diff"

if [ -f "$old_diff" ]; then
  git diff --no-index "$old_diff" "$new_diff"
else
  less "$new_diff"
fi

[ "$2" = 'true' ] && mv "$new_diff" "$old_diff" || rm "$new_diff"

