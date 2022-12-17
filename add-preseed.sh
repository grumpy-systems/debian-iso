#!/bin/bash

set -e
set -x

PRESEEDFILE=$1
DIR=$2

# Add the preseed.cfg file.
cp $PRESEEDFILE "$DIR"/preseed.cfg
cp isolinux.cfg "$DIR"/isolinux/isolinux.cfg

# Regenerate sums
cd "$DIR"
chmod +w md5sum.txt
find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt
chmod -w md5sum.txt
