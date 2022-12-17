#!/bin/sh

set +x

echo 'Running finall installer scripts'

for f in /cdrom/sthse/install.d/*.sh; do
    echo "Running $f ..."

    /bin/sh "$f" -H
done