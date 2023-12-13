publish version:
    docker push ghcr.io/bitbytelabio/postgres:{{version}}

build version:
    docker build -t \
        ghcr.io/bitbytelabio/postgres:{{version}} \
        --build-arg IMAGE_VERSION={{version}}-bookworm \
        src