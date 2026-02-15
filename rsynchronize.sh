#!/bin/bash

SOURCE="/"
DEST="/ext4/debbie_backups"
LOGFILE="/var/log/rsync-backup.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "Backup started at $DATE" > "$LOGFILE"

rsync -av \
  --exclude={'dev','media','mnt','mount','proc','run','sys','tmp','var/tmp','home/*/.local'} \
  --exclude 'ntfs' \
  --exclude 'ext4' \
  --exclude 'win_ssd' \
  --delete "$SOURCE" "$DEST" >> "$LOGFILE" 2>&1

echo "Backup completed at $DATE" >> "$LOGFILE"

# NOTE: Rsync's "-a" means:
# 
# -v, --verbose               increase verbosity
# -h, --human-readable        output numbers in a human-readable format
#     --progress              show progress during transfer
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
# -m, --prune-empty-dirs      prune empty directory chains from file-list
#
#      --delete                delete extraneous files from dest dirs
# -z, --compress              compress file data during the transfer
#     --compress-choice=STR, --zc=STR      choose compression from lz4 (fastest), zstd, zlibx, zlib (slowest), none
