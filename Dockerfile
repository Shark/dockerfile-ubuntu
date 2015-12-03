FROM ubuntu:trusty
MAINTAINER Felix Seidel <felix@seidel.me>

ENV DEBIAN_FRONTEND noninteractive
ADD config /config
ADD etc /etc

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nano supervisor && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    mkdir -p /config /data && \
    chmod +x /config/loop && \
    groupadd --gid 500 core && \
    useradd --uid 500 --gid core core && \
    chown core:core /data

VOLUME /data
CMD ["/bin/bash", "/config/loop"]
