FROM alpine:latest
RUN apk update
RUN apk add openjdk8 git maven