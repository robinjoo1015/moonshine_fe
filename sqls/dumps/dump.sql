pg_dump \
  -h localhost \
  -p 5432 \
  -U whbaek -W \
  --data-only \
  --column-inserts \
  --on-conflict-do-nothing \
  moonshine > moonshine_dump.sql
