FROM golang:1.14-alpine3.11

ARG APP_VERSION

LABEL maintainer="fernando.ribeiro@geocrafter.eu" \
    vendor="Geocrafter - Geospatial Studio" \
    description="An Alpine based derivative for CrunchyData pg_tileserv" \
    org.opencontainers.image.vendor="Geocrafter - Geospatial Studio" \
    os.version="3.11" \
    app.version="${APP_VERSION}"

RUN apk add --no-cache --update tar wget gzip

RUN mkdir /app && cd /app && \
    wget -q https://github.com/CrunchyData/pg_tileserv/archive/v${APP_VERSION}.tar.gz -O pg_tileserv.tar.gz && \
    tar -xvzf pg_tileserv.tar.gz && rm pg_tileserv.tar.gz && cd pg_tileserv-${APP_VERSION} && go build -v && \
    cp pg_tileserv ../ && cp -R assets ../ && cd .. && rm -rf /app/pg_tileserv-${APP_VERSION} && \
    chmod -R 644 /app && chmod a+x /app/pg_tileserv

RUN apk del tar wget gzip

VOLUME ["/config"]

EXPOSE 7800

WORKDIR /app
ENTRYPOINT ["/app/pg_tileserv"]
CMD []
