#!/bin/sh

echo "storehouse ALL=(ALL) NOPASSWD: ALL" > /target/etc/sudoers.d/90-storehouse
chmod 440 /target/etc/sudoers.d/90-storehouse
