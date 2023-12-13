publish version:
    docker push ghcr.io/bitbytelabio/postgres:{{version}}

build version os:
    docker build -t \
        ghcr.io/bitbytelabio/postgres:{{version}} \
        --build-arg PG_VERSION={{version}} \
        --build-arg OS_RELEASE={{os}} \
        src