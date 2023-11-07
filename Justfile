# build:
#     docker build -t ghcr.io/bitbytelabio/postgres:15 --build-arg IMAGE_VERSION=15-bullseye .
#     docker build -t reg.bitbytelab.io/private/postgres:15 \
#         --build-arg IMAGE_VERSION=15-bullseye \
#         --build-arg OS_BASE=debian \
#         --build-arg OS_CODE_NAME=bullseye \
# .

publish:
    docker push ghcr.io/bitbytelabio/postgres:15
    docker push reg.bitbytelab.local/private/postgres:15

build type:
    docker build -t \
        reg.bitbytelab.local/private/postgres:15-{{type}} \
        --build-arg IMAGE_VERSION=15-bookworm \
        --build-arg OS_BASE=debian \
        --build-arg OS_CODE_NAME=bookworm \
        {{type}} \