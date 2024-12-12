#!/usr/local/bin/bash

# ./sync-to-mon.sh
# as root on mon, ./mount-and-build.sh
# ./sync-from-mon.sh
# ./sync-to-lsg-provision.sh

RELEASE=13.3-RELEASE

export http_proxy=http://proxy.lbl.gov:3128
export HTTPS_PROXY=http://proxy.lbl.gov:3128

if pkg info|grep ca_root_nss; then
    echo ca_root_nss installed
else
    pkg install -y security/ca_root_nss
fi

download=true
if $download; then
    mkdir $RELEASE
    cd $RELEASE
    curl -OL https://download.freebsd.org/ftp/releases/amd64/${RELEASE}/base.txz
    curl -OL https://download.freebsd.org/ftp/releases/amd64/${RELEASE}/kernel.txz

    # mkdir 13.2-RELEASE
    # cd 13.2-RELEASE
    # curl -OL https://download.freebsd.org/ftp/releases/amd64/13.2-RELEASE/base.txz
    # curl -OL https://download.freebsd.org/ftp/releases/amd64/13.2-RELEASE/kernel.txz
    cd ..
fi

if [ `id -u` != 0 ]; then
    echo must be root
    exit 1
fi

# special edition with FreeBSD included
make clean
make iso BASE=`pwd`/${RELEASE} RELEASE=${RELEASE} ARCH=amd64 SE=1 V=1
sha256sum mfsbds-se-${RELEASE}-amd64.iso > mfsbds-se-${RELEASE}-amd64.iso.sha256
