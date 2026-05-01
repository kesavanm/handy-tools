#!/bin/bash

dir=/media/kesavan/Windows1/Users/kesavan/Nextcloud/__radios__
sum_mb=0

walk_dir() {

        MAX_SIZE=50 # in MB
        size_in_bytes=$((MAX_SIZE*1024*1024))

    local dir="$1"
    local total=0
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            walk_dir "$file"
        elif [ -f "$file" ]; then
            local size=$(stat -c '%s' "$file")
            if [ $size -gt $size_in_bytes ]; then
                local size_mb=$(echo "$size / 1048576" | bc -l | awk '{printf "%d", $0}')
                printf "%10s %10s %-50s \n" "$size_mb mb" "$(sha1sum "$file" | awk '{print $1}')" "$file" 
                ((total+=size_mb))
            fi
        fi
    done
}