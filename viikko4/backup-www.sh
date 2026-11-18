#!/bin/bash

SOURCE="/var/www/html/"
DEST="/srv/backups/www"
DATE=$(date +%Y%m%d-%H%M%S)

mkdir -p "$DEST"

rsync -a "$SOURCE" "$DEST/backup-$DATE/"

cd "$DEST" || exit

ls -dt backup-* | tail -n +6 | xargs -r rm -rf

echo "$(date) - Backup successful: backup-$DATE" >> "$DEST/backup.log"
