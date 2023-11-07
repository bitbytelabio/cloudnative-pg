ARG IMAGE_VERSION=15.0-bullseye

FROM postgres:${IMAGE_VERSION}

LABEL org.opencontainers.image.source https://github.com/bitbytelabio/pg-docker

# Install additional packages
RUN set -xe; \
    apt-get update; \
    apt-get install -y wget; \
    rm -rf /var/lib/apt/lists/*;

ARG OS_BASE=debian
ARG OS_CODE_NAME=bullseye

# Install timescaledb repository
RUN echo "deb https://packagecloud.io/timescale/timescaledb/${OS_BASE}/ ${OS_CODE_NAME} main" | tee /etc/apt/sources.list.d/timescaledb.list; \
    wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add -

# Install additional extensions
RUN set -xe; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    "postgresql-${PG_MAJOR}-pgaudit" \
    "postgresql-${PG_MAJOR}-pgvector" \
    "postgresql-${PG_MAJOR}-pg-failover-slots" \
    "timescaledb-2-postgresql-${PG_MAJOR}" \
    ; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*;

EXPOSE 5432