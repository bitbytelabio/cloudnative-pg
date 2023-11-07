docker build -t reg.bitbytelab.io/private/postgres:15 \
    --build-arg IMAGE_VERSION=15-bullseye \
    --build-arg OS_BASE=debian \
    --build-arg OS_CODE_NAME=bullseye \
    .
docker build -t ghcr.io/bitbytelabio/postgres:15 \
    --build-arg IMAGE_VERSION=15-bullseye \
    --build-arg OS_BASE=debian \
    --build-arg OS_CODE_NAME=bullseye \
    .
