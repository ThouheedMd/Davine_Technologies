#!/bin/bash
# clean_logs.sh - Delete .log files older than N days
# Usage: ./clean_logs.sh [log_dir] [days]

LOG_DIR="${1:-$HOME/DevOps/Logs}"
DAYS="${2:-7}"

if [ ! -d "$LOG_DIR" ]; then
    echo "ERROR: Log directory '$LOG_DIR' does not exist."
    exit 1
fi

echo "Cleaning .log files older than $DAYS days in $LOG_DIR"
COUNT=$(find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" | wc -l)
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" -print -delete
echo "Removed $COUNT file(s)."