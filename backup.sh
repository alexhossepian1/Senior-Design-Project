#!/usr/bin/env bash
# Nightly Postgres backup. Install with:
#   chmod +x deploy/backup.sh
#   crontab -e
#   0 3 * * * /home/YOURUSER/rc-part-picker/deploy/backup.sh >> /home/YOURUSER/backup.log 2>&1
set -euo pipefail

cd "$(dirname "$0")"
set -a; source .env; set +a

BACKUP_DIR="${BACKUP_DIR:-$HOME/backups}"
KEEP_DAYS="${KEEP_DAYS:-14}"
mkdir -p "$BACKUP_DIR"

STAMP=$(date +%Y%m%d-%H%M%S)
OUT="$BACKUP_DIR/rcpp-$STAMP.sql.gz"

docker compose exec -T db \
  pg_dump -U "$DB_USER" -d "$DB_NAME" --clean --if-exists \
  | gzip > "$OUT"

# Fail loudly if the dump came out suspiciously small
SIZE=$(stat -c%s "$OUT")
if [ "$SIZE" -lt 1024 ]; then
  echo "ERROR: backup is only ${SIZE} bytes, something is wrong" >&2
  exit 1
fi

find "$BACKUP_DIR" -name 'rcpp-*.sql.gz' -mtime +"$KEEP_DAYS" -delete
echo "$(date -Is) backup ok: $OUT ($SIZE bytes)"
