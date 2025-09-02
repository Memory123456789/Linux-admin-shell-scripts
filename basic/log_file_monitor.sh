#!/bin/bash
# ============================================
# Script Name : log_file_monitor.sh
# Description : Basic log monitoring script
# Author      : Leelakrishna
# ============================================
echo "------------Logs-monitor-------------------"
LOG_FILE="/var/log/syslog"

# Checking if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "❌ Log file $LOG_FILE not found!"
fi

echo "------------Log File Monitor-------------------"
echo "🔹 Last 10 lines of $LOG_FILE:"
tail -n 10 "$LOG_FILE"
echo "----⚠️  Errors/Warnings in the last 50 lines:----------"
tail -n 50 "$LOG_FILE" | grep -i -E "error|fail|warn" || echo "No errors found."
