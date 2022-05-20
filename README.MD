# pg_tileserv-alpine

An Alpine based derivative for [CrunchyData pg_tileserv](https://github.com/CrunchyData/pg_tileserv)

The aim of this repository is to build `pg_tileserv` based on the official releases packages provided by CrunchyData.

It also contains a minimal `varnish` based cache implementation. See `docker-compose.yml` for details. 

## Docker Hub

`docker pull geocraftergs/pg_tileserv-alpine`

## Run (without Varnish)
`docker run -dt -e DATABASE_URL=postgres://user:pass@host/dbname -p 7800:7800 geocraftergs/pg_tileserv-alpine`

Your pg_tileserv should be available at `localhost:7800`

## Run pg_tileserv + varnish stack

`docker-compose up -d`

Your pg_tileserv should be available at `localhost`

## Build locally a specific version of pg_tileserv

`docker build --build-arg APP_VERSION=xxxx .`

`APP_VERSION` should match the name of an official release of pg_tileserv. See [pg_tileserv releases](https://github.com/CrunchyData/pg_tileserv/releases)

## Version matrix

|Image tag   | App version  | OS Version  |
|---|---|---|
|latest | 1.0.8 | 3.15 |
|1.0.2   | 1.0.2  | 3.11 |
|1.0.8   | 1.0.8  | 3.15 |
