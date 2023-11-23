ARG IMAGE_VERSION=15-bookworm

FROM postgres:${IMAGE_VERSION}

LABEL org.opencontainers.image.description="This Docker image contains PostgreSQL, TimescaleDB and Barman Cloud."

LABEL org.opencontainers.image.source https://github.com/bitbytelabio/pg-docker

COPY requirements.txt /

# Install additional packages
RUN set -xe; \
    apt-get update; \
    apt-get install -y wget; \
    rm -rf /var/lib/apt/lists/*;

# Install timescaledb repository
RUN echo "deb https://packagecloud.io/timescale/timescaledb/debian/ bookworm main" | tee /etc/apt/sources.list.d/timescaledb.list; \
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

# Install barman-cloud
RUN set -xe; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    barman \
    barman-cli \
    barman-cli-cloud \
    ; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*;

# Change the uid of postgres to 26
RUN usermod -u 26 postgres
USER 26