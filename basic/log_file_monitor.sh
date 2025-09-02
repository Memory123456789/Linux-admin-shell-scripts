#!/bin/bash
# log_file_monitor.sh - Basic log monitoring script

# Default log file (can be changed)
LOG_FILE="/var/log/syslog"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "❌ Log file $LOG_FILE not found!"
    exit 1
fi

echo "------------Log File Monitor-------------------"
echo "🔹 Last 10 lines of $LOG_FILE:"
tail -n 10 "$LOG_FILE"

echo
echo "⚠️  Errors/Warnings in the last 50 lines:"
# Search last 50 lines for error keywords (case-insensitive)
tail -n 50 "$LOG_FILE" | grep -i -E "error|fail|warn" || echo "No errors found."
