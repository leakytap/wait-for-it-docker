FROM debian:stable

RUN apt-get update

RUN apt-get install wait-for-it
