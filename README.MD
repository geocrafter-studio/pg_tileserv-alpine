# pg_tileserv-alpine

An Alpine based derivative for [CrunchyData pg_tileserv](https://github.com/CrunchyData/pg_tileserv)

## Docker Hub

`docker pull geocraftergs/pg_tileserv-alpine`

## Run
`docker run -dt -e DATABASE_URL=postgres://user:pass@host/dbname -p 7800:7800 geocraftergs/pg_tileserv-alpine`

## Version matrix

|Image tag   | App version  | OS Version  |
|---|---|---|
|latest | 1.0.2 | 3.11 |
|1.0.2   | 1.0.2  | 3.11 |
