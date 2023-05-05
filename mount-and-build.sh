#!/usr/local/bin/bash

download=false
if $download; then
    mkdir 13.1-RELEASE
    cd 13.1-RELEASE
    curl -OL https://download.freebsd.org/ftp/releases/amd64/13.1-RELEASE/base.txz
    curl -OL https://download.freebsd.org/ftp/releases/amd64/13.1-RELEASE/kernel.txz
    cd ..
fi

if [ `id -u` != 0 ]; then
    echo must be root
    exit 1
fi

# special edition with FreeBSD included
make iso BASE=`pwd`/13.1-RELEASE RELEASE=13.1-RELEASE ARCH=amd64 SE=1
