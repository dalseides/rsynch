#!/bin/bash

SOURCE="/"
DEST="/ext4/debbie_backups"
LOGFILE="/var/log/rsync-backup.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "Backup started at $DATE" > "$LOGFILE"

rsync -av \
  --exclude 'ntfs' \
  --exclude 'ext4' \
  --exclude 'win_ssd' \
  --exclude 'mnt' \
  --exclude 'media' \
  --exclude 'proc' \
  --exclude 'var/tmp' \
  --exclude 'home/dalseides/.local' \
  --delete "$SOURCE" "$DEST" >> "$LOGFILE" 2>&1

echo "Backup completed at $DATE" >> "$LOGFILE"

