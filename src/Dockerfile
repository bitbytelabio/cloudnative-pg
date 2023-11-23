ARG IMAGE_VERSION=15.0-bullseye

FROM postgres:${IMAGE_VERSION}

LABEL org.opencontainers.image.description="This Docker image contains PostgreSQL and Barman Cloud based on Postgres ${IMAGE_VERSION}."

LABEL org.opencontainers.image.source https://github.com/bitbytelabio/pg-docker

COPY requirements.txt /

# Install additional packages
RUN set -xe; \
    apt-get update; \
    apt-get install -y wget; \
    rm -rf /var/lib/apt/lists/*;

# Install timescaledb repository
RUN echo "deb https://packagecloud.io/timescale/timescaledb/debian/ bullseye main" | tee /etc/apt/sources.list.d/timescaledb.list; \
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

RUN set -xe; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3-psycopg2 \
    python3-setuptools \
    python-snappy \
    ; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*; 

# Install barman-cloud
RUN pip3 install --upgrade pip; \
    pip3 install --no-deps -r requirements.txt; 

# Change the uid of postgres to 26
RUN usermod -u 26 postgres
USER 26