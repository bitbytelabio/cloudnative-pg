publish version os:
    docker push ghcr.io/bitbytelabio/postgres-{{os}}:{{version}}

build version os:
    docker build -t \
        ghcr.io/bitbytelabio/postgres-{{os}}:{{version}} \
        --build-arg PG_VERSION={{version}} \
        --build-arg OS_RELEASE={{os}} \
        src