#!/bin/bash

get_cpu_stats() {
    grep '^cpu ' /proc/stat | awk '{print $2, $3, $4, $5, $6, $7, $8, $9, $10, $11}'
}
calculate_cpu_usage() {
    read user nice system idle iowait irq softirq steal guest guest_nice <<< $(get_cpu_stats)
    total_cpu_time=$((user + nice + system + idle + iowait + irq + softirq + steal))
    total_active_time=$((user + nice + system + iowait + irq + softirq + steal))
    sleep 1
    read user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 guest2 guest_nice2 <<< $(get_cpu_stats)
    total_cpu_time2=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))
    total_active_time2=$((user2 + nice2 + system2 + iowait2 + irq2 + softirq2 + steal2))
    total_diff=$((total_cpu_time2 - total_cpu_time))
    active_diff=$((total_active_time2 - total_active_time))
    if [ $total_diff -gt 0 ]; then
        cpu_usage=$(awk "BEGIN {printf \"%.2f\", ($active_diff * 100.0) / $total_diff}")
        echo "$cpu_usage%"
    else
        echo "0.00%"
    fi
}
calculate_cpu_usage
