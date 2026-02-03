FROM alpine:latest

# https://mirrors.alpinelinux.org/
RUN sed -i 's@dl-cdn.alpinelinux.org@ftp.halifax.rwth-aachen.de@g' /etc/apk/repositories

RUN apk update
RUN apk upgrade

# required vnstat
RUN apk add --no-cache \
  gcc make linux-headers musl-dev zlib-dev zlib-static \
  python3-dev curl g++ git sqlite-static sqlite-libs sqlite-dev \
  bash xz

ENV XZ_OPT=-e9
COPY build-static-vnstat.sh build-static-vnstat.sh
RUN chmod +x ./build-static-vnstat.sh
RUN bash ./build-static-vnstat.sh
