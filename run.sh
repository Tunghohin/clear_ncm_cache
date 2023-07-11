#!/bin/bash

script_path=$(pwd)
clear_script="$script_path/clear_cache.sh"

echo "rm -rf ~/.cache/netease-cloud-music/CachedSongs" > "$clear_script"
echo "rm -rf ~/.cache/netease-cloud-music/AlbumCover" >> "$clear_script"

chmod +x "$clear_script"




temp_cron_file=$(mktemp)

#run the script at 3:00 a.m. every day
cron_expression="0 3 * * * $clear_script"

crontab -l > "$temp_cron_file"

echo "$cron_expression" >> "$temp_cron_file"

crontab $temp_cron_file

rm -f $temp_cron_file
