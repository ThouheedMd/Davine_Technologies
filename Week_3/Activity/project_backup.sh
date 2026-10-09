#!/bin/bash
# project_backup.sh - Week 3 activity script
# Creates project directories, copies project files, generates a
# timestamped backup and compresses it into an archive.

BASE_DIR="$HOME/DevOps"
PROJECT_DIR="$BASE_DIR/Projects"
BACKUP_DIR="$BASE_DIR/Backup"
LOG_FILE="$BASE_DIR/Logs/backup.log"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE="$BACKUP_DIR/project_backup_$TIMESTAMP.tar.gz"

# 1. Create project directories (must exist before logging)
mkdir -p "$PROJECT_DIR" "$BACKUP_DIR" "$BASE_DIR/Logs"

log() { echo "[$(date '+%F %T')] $1" | tee -a "$LOG_FILE"; }
log "Directories ready."

# 2. Copy project files (create a sample file if none exist)
if [ -z "$(ls -A "$PROJECT_DIR")" ]; then
    echo "Sample project file created on $(date)" > "$PROJECT_DIR/sample.txt"
fi
STAGING=$(mktemp -d)
cp -r "$PROJECT_DIR"/. "$STAGING"/
log "Project files copied."

# 3 & 4. Generate backup and compress into an archive
if tar -czf "$ARCHIVE" -C "$STAGING" .; then
    log "Backup created: $ARCHIVE ($(du -h "$ARCHIVE" | cut -f1))"
else
    log "ERROR: backup failed."
    rm -rf "$STAGING"; exit 1
fi
rm -rf "$STAGING"