#!/bin/bash
#author: Amarachi
#description: A script to archive log files with timestamps and log the archive events


echo "=============================="
echo "      LOG ARCHIVE REPORT"
echo "=============================="

LOG_DIR="$1"

# Check if user provided a directory
if [ -z "$LOG_DIR" ]; then
   echo "Error: No log directory provided."
   echo "Usage: $0 <log-directory>"
  exit 1
fi

# Check if directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory $LOG_DIR does not exist."
  exit 1
fi

# Prepare timestamp, archive name, and log file
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_DIR="./archives"
LOG_FILE="./archive_history.log"

# Ensure archive directory exists
mkdir -p "$ARCHIVE_DIR"

# Compress the logs
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

# Log the archive event
echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived logs from $LOG_DIR to ${ARCHIVE_NAME}" >> "$LOG_FILE"

# Completion message
echo "Archive created: ${ARCHIVE_DIR}/${ARCHIVE_NAME}"
echo "Logged archive history to $LOG_FILE"
