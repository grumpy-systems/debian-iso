# Storehouse Debian Image

This is a remastered Debian ISO image used to provide a default installation
base for Storehouse services.

## Building This ISO

This ISO file is pulled directly from the debian release mirror, and will pull
the latest `netinst` image.  This file is about 300MB, and will be downloaded
each build if it doesn't exist.

To build, run `ant` as root:

```bash
sudo ant
```

Root permissions are needed as many of the files that are extracted from the ISO
have root ownership.  Otherwise, the cleanup commands would not work.

## Upstream Reference

The procedure used here (along with the preseed file) is based on the examples
in the Debian wiki:

* https://wiki.debian.org/DebianInstaller/Preseed
* https://wiki.debian.org/DebianInstaller/Preseed/EditIso

## Assumptions Made

This image is built with a couple of assumptions:

1) The default user password will be changed immediately.  It's setup to be
   static, which is obviously very bad for any sort of production usage.  The
   Storehouse installer will take care of changing this.
2) The installation is completely automated, and will overwrite the first hard
   drive the system sees (`/dev/sda`).
3) The image is not designed to be written to actual media like a CD or USB
   drive.  It's sole purpose is to boot virtual machines.  _In Theory_ it can be
   written to a plain CD, but this has never been tested.
