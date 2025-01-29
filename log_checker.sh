#!/bin/bash

LOG_DIR="/var/log"
ERROR_PATTERNS="error|Error|ERROR|warning|Warning|WARNING"

# File for the report
REPORT_FILE="/tmp/error_report_$(date +%Y%m%d_%H%M%S).txt"

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Directory $LOG_DIR not found."
    exit 1
fi

# Count the total number of errors
TOTAL_ERRORS=$(grep -Eri "$ERROR_PATTERNS" "$LOG_DIR" | wc -l)

# Prepare the report
{
    echo "Log check report from $LOG_DIR"
    echo "Date: $(date)"
    echo "\nTotal number of errors: $TOTAL_ERRORS\n"

    echo "Top 10 most frequent errors:"
    grep -Eri "$ERROR_PATTERNS" "$LOG_DIR" | \
        awk '{ $1=$2=$3=""; print $0 }' | \
        sort | uniq -c | sort -rh | head -n 10
} > "$REPORT_FILE"

# Output the path to the report
echo "Report generated: $REPORT_FILE"