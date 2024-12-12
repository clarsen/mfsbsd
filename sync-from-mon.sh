#!/bin/bash
set -eEuo pipefail
cd $(dirname $0)
rsync -av --exclude=work --exclude=sync-from-mon.sh mon.lbl.gov:src/mfsbsd/ .
