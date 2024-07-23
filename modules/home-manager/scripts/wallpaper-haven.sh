#!/usr/bin/env bash

WH_CONFIG_PATH="${HOME}/.config/.wallhaven.ini"

mkdir "${HOME}/.config" 2>/dev/null
touch "$WH_CONFIG_PATH"
source <(grep '=' "$WH_CONFIG_PATH")

[ -n "$API_KEY" ] && qs="?apikey=${API_KEY}&" || qs=?
[ -n "$Q" ] && qss="${qs}q=${Q}&" || qss="$qs"
qss="${qss}categories=${CATEGORIES:-100}&"
qss="${qss}purity=${PURITY:-100}&"
qss="${qss}sorting=${SORTING:-toplist}&"
qss="${qss}order=${ORDER:-desc}&"
qss="${qss}topRange=${TOP_RANGE:-1y}&"
qss="${qss}atleast=${AT_LEAST:-1920x1080}&"
[ -n "$RESOLUTIONS" ] && qss="${qss}resolutions=${RESOLUTIONS}&"
qss="${qss}ratios=${RATIOS:-16x9%2C16x10}&"
[ -n "$COLORS" ] && qss="${qss}colors=${COLORS}&"

last_page="$(curl -s "https://wallhaven.cc/api/v1/search${qss}" | jq -r '.meta.last_page')"
last_page="$((last_page - 1))"
[ $last_page -lt 1 ] && last_page=1
DEFAULT_PAGE_SEED="$RANDOM"

[ -n "$PAGE" ] && qss="${qss}page=$(((PAGE % last_page) + 1))&" || qss="${qss}page=$(((DEFAULT_PAGE_SEED % last_page) + 1))&"

[ -n "$SEED" ] && qss="${qss}seed=${SEED}"

ITEM_INDEX_SEED="$RANDOM"
ITEM_INDEX="$(((ITEM_INDEX_SEED % 24) + 1))" # Could break if the provided query params result in fewer items

data="$(curl -s "https://wallhaven.cc/api/v1/search${qss}" | jq --arg INDEX "$ITEM_INDEX" '.data[$INDEX | tonumber]')"
id="$(jq -r '.id' <<<"$data")"
file_type="$(jq -r '.file_type' <<<"$data")"

download_url="$(curl -s "https://wallhaven.cc/api/v1/w/${id}${qs}" | jq -r '.data.path')${qs}"

tmp_dir="$(mktemp -d -t)"

if [ ! "$file_type" = 'image/png' ]; then
  filepath="${tmp_dir}/${id}.jpg"
fi

filepath="${tmp_dir}/${id}.png"

curl -s -o "$filepath" "$download_url"

if [ ! "$file_type" = 'image/png' ]; then
  magick "$filepath" "${filepath%.jpg}.png" # Convert to png for kitty's sake
  filepath="${tmp_dir}/${id}.png"
fi

kitty @ set-background-image -a -c "$filepath"

