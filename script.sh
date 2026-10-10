#!/bin/bash

INTERVAL=5
DIR=$(dirname "$0")
LOG="$DIR/monitor.log"

while true; do
    TIME=$(date '+%Y-%m-%d %H:%M:%S')
    {
        echo "--- $TIME ---"
        echo
        echo "free -h:"
        free -h
        echo
        echo "df -h:"
        df -h
        echo
        echo "uptime:"
        uptime
        echo
    } >> "$LOG"
    
    sleep $INTERVAL
done