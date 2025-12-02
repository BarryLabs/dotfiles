#!/bin/bash
get_disk_usage_percentage() {
    local path="${1:-/}"  # Use provided path or default to root filesystem
    if [ ! -e "$path" ]; then
        echo "Error: Path '$path' does not exist" >&2
        return 1
    fi
    df "$path" | awk 'NR==2 {gsub(/%/, "", $5); print $5}'
}
get_disk_usage_percentage "$1"
