#!/bin/bash
set -eEuo pipefail
cd $(dirname $0)
RELEASE=13.3-RELEASE

#src=mfsbsd-se-13.1-RELEASE-amd64.iso
src=mfsbsd-se-${RELEASE}-amd64.iso
dest=$src
sha256sum $src
scp $src lsg-provision.lbl.gov:/home/data/lsg-provision.lbl.gov/www/FreeBSD/$dest


