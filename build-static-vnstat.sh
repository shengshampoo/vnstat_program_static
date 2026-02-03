#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

# vnstat
cd $WORKSPACE
git clone https://github.com/vergoh/vnstat
cd vnstat
LDFLAGS="-static -no-pie -s" ./configure --prefix=/usr/local/vnstatmm
make
make install

cd /usr/local
tar vcJf ./vnstatmm.tar.xz vnstatmm

mv ./vnstatmm.tar.xz /work/artifact/
