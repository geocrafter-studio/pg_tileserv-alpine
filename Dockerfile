FROM golang:1.18-alpine3.15

ARG APP_VERSION

RUN apk add --no-cache --update tar wget gzip

RUN mkdir /app && cd /app && \
    wget -q https://github.com/CrunchyData/pg_tileserv/archive/v${APP_VERSION}.tar.gz -O pg_tileserv.tar.gz && \
    tar -xvzf pg_tileserv.tar.gz && rm pg_tileserv.tar.gz && \
    cd pg_tileserv-${APP_VERSION} && go build -v -ldflags "-s -w -X main.programVersion=${APP_VERSION}" && \
    cp pg_tileserv ../ && cp -R assets ../ && cd .. && rm -rf /app/pg_tileserv-${APP_VERSION} && \
    chmod -R 644 /app && chmod a+x /app/pg_tileserv

FROM alpine:3.15

LABEL maintainer="fernando.ribeiro@geocrafter.eu" \
    vendor="Geocrafter - Geospatial Studio" \
    description="An Alpine based derivative for CrunchyData pg_tileserv" \
    org.opencontainers.image.vendor="Geocrafter - Geospatial Studio" \
    os.version="3.15" \
    app.version="${APP_VERSION}"

RUN apk --no-cache add ca-certificates && mkdir /app
WORKDIR /app/
COPY --from=0 /app/pg_tileserv /app/
COPY --from=0 /app/assets /app/assets

VOLUME ["/config"]

USER 1001
EXPOSE 7800

WORKDIR /app
ENTRYPOINT ["/app/pg_tileserv"]
CMD []
