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

# NOTE: Rsync's "-a" means:
# 
# -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
#  -r, --recursive             recurse into directories
#  -l, --links                 copy symlinks as symlinks
#  -p, --perms                 preserve permissions
#  -t, --times                 preserve modification times
#  -g, --group                 preserve group
#      --devices               preserve device files (super-user only)
#      --specials              preserve special files
#  -D                          same as --devices --specials
#  -o, --owner                 preserve owner (super-user only)
# 
#  -H, --hard-links            preserve hard links
#  -A, --acls                  preserve ACLs (implies -p)
#  -X, --xattrs                preserve extended attributes
# 
# -v, --verbose               increase verbosity
