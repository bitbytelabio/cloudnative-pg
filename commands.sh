docker build -t reg.bitbytelab.io/private/postgres:15 \
    --build-arg IMAGE_VERSION=15-bookworm \
    --build-arg OS_BASE=debian \
    --build-arg OS_CODE_NAME=bookworm \
    .
