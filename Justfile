build:
    docker build -t ghcr.io/bitbytelabio/postgres:15 --build-arg IMAGE_VERSION=15-bullseye .
    docker build -t reg.bitbytelab.io/private/postgres:15 --build-arg IMAGE_VERSION=15-bullseye .

publish:
    docker push ghcr.io/bitbytelabio/postgres:15
    docker push reg.bitbytelab.io/private/postgres:15