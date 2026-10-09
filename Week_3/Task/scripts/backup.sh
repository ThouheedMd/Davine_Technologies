#!/bin/bash
# backup.sh - Back up a directory into a timestamped .tar.gz archive
# Usage: ./backup.sh [source_dir] [backup_dir]

SOURCE_DIR="${1:-$HOME/DevOps/Projects}"
BACKUP_DIR="${2:-$HOME/DevOps/Backup}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

if tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"; then
    echo "Backup created: $ARCHIVE ($(du -h "$ARCHIVE" | cut -f1))"
else
    echo "ERROR: Backup failed."
    exit 1
fi