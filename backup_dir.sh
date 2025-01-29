#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 source_directory backup_directory"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

SOURCE_DIR=$1
BACKUP_DIR=$2
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist."
    exit 1
fi

# Create backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Create the backup
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

echo "Backup of $SOURCE_DIR completed successfully."
echo "Backup file: $BACKUP_DIR/$BACKUP_NAME"