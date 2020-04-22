# pg_tileserv-alpine

An Alpine based derivative for [CrunchyData pg_tileserv](https://github.com/CrunchyData/pg_tileserv)

## Run
docker run -dt -e DATABASE_URL=postgres://user:pass@host/dbname -p 7800:7800 geocraftergs/pg_tileserv-alpine
