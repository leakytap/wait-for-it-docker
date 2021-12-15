FROM debian:stable

LABEL org.opencontainers.image.source https://github.com/leakytap/wait-for-it-docker
LABEL org.opencontainers.image.description "Docker image that contains wait-for-it script"

RUN apt-get update

RUN apt-get install ca-certificates && update-ca-certificates

RUN apt-get install wait-for-it
