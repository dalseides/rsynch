#!/bin/bash

SOURCE="/"
DEST="/ext4/debbie_backups"
LOGFILE="/var/log/rsync-backup.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "Backup started at $DATE" > "$LOGFILE"

rsync -av \
  --exclude 'dev' \
  --exclude 'media' \
  --exclude 'mnt' \
  --exclude 'mount' \
  --exclude 'proc' \
  --exclude 'run' \
  --exclude 'sys' \
  --exclude 'tmp' \
  --exclude 'var/tmp' \
  --exclude 'ntfs' \
  --exclude 'ext4' \
  --exclude 'win_ssd' \
  --exclude 'home/dalseides/.local' \
  --delete "$SOURCE" "$DEST" >> "$LOGFILE" 2>&1

echo "Backup completed at $DATE" >> "$LOGFILE"

