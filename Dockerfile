ARG IMAGE_VERSION=15.0-bullseye

FROM postgres:${IMAGE_VERSION}

ARG IMAGE_VERSION
# Do not split the description, otherwise we will see a blank space in the labels
LABEL name="PostgreSQL Container Images" \
    vendor="The CloudNativePG Contributors" \
    version="${PG_VERSION}" \
    release="10" \
    summary="PostgreSQL Container images." \
    description="This Docker image contains PostgreSQL and Barman Cloud based on Postgres ${IMAGE_VERSION}."

LABEL org.opencontainers.image.description="This Docker image contains PostgreSQL and Barman Cloud based on Postgres ${IMAGE_VERSION}."

LABEL org.opencontainers.image.source https://github.com/bitbytelabio/pg-docker

COPY requirements.txt /

RUN set -xe; \
    apt-get update; \
    apt-get install -y wget; \
    rm -rf /var/lib/apt/lists/*;

ARG OS_BASE=debian
ARG OS_CODE_NAME=bullseye

RUN echo "deb https://packagecloud.io/timescale/timescaledb/${OS_BASE}/ ${OS_CODE_NAME} main" | tee /etc/apt/sources.list.d/timescaledb.list

RUN wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add -

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
    python3-pip \
    python3-psycopg2 \
    python3-setuptools \
    ; \
    pip3 install --upgrade pip; \
    pip3 install --no-deps -r requirements.txt; \
    rm -rf /var/lib/apt/lists/*;

# Change the uid of postgres to 26
RUN usermod -u 26 postgres
USER 26