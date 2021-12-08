# wait-for-it-docker
A docker image that includes a [wait-for-it](https://github.com/vishnubob/wait-for-it) script

## Usage

Dockerfile:
``` Dockerfile
ARG BASE_IMAGE=gcr.io/distroless/static
FROM golang:1.17-alpine as builder
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN go build -mod vendor -o ./bin/app ./cmd/app
################
FROM $BASE_IMAGE
COPY --from=builder /app/bin/app /app
ENTRYPOINT ["/app"]
```

Docker compose:
``` yaml
version: "3.5"
services:
  app:
    build:
      args:
        BASE_IMAGE: ghcr.io/leakytap/wait-for-it-docker:latest
    entrypoint: wait-for-it postgres:5432 -- ./app
    depends_on:
        - postgres

```
