#!/bin/bash
set -eEuo pipefail
cd $(dirname $0)
find . -type f -print | entr rsync -av --delete . mon.lbl.gov:src/mfsbsd
