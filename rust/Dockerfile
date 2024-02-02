FROM amd64/rust:slim-bullseye
ARG USER_ID

RUN if getent passwd $USER_ID >/dev/null; then \
        existing_user=$(getent passwd $USER_ID | cut -d: -f1) && \
        usermod -l debian $existing_user; \
    else \
        useradd -u $USER_ID -m debian; \
    fi

RUN mkdir /boltz-dart
RUN chown -R debian /boltz-dart

RUN apt-get update --allow-releaseinfo-change && \
    apt-get install -y build-essential \
    cmake apt-transport-https ca-certificates curl \
    wget gnupg2 software-properties-common dirmngr unzip \
    openssl libssl-dev git expect jq lsb-release tree \
    pkg-config autoconf libtool neovim

// CHANGE THIS TO ONLY USE LINUX TARGETS
RUN rustup target add x86_64-unknown-linux-gnu

RUN mkdir /.cargo
COPY config /.cargo/config
RUN chown -R debian /.cargo

ENV CARGO_HOME=/.cargo
ENV NDK_VERSION=23.0.7599858


VOLUME ["/boltz-dart"]

COPY docker-entrypoint.sh /usr/bin
USER debian

ENTRYPOINT ["docker-entrypoint.sh"]

# docker build --platform linux/x86_64 --build-arg USER_ID=$(id -u) -t bwcbuilder . 
# in the project root directory run:
# docker run --platform linux/x86_64 --name bwcbuilder01 -v $PWD:/boltz-dart bwcbuilder && docker stop bwcbuilder01 && docker rm bwcbuilder01