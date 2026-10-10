INTERVAL=5
DIR=$(dirname "$0")
LOG="$DIR/monitor.log"

while true; do
    TIME=$(date '+%Y-%m-%d %H:%M:%S')
    {
        echo "--- $TIME ---"
        free -h
    } >> "$LOG"
    
    sleep $INTERVAL
done