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

The procedure used here (along with the preseed file) is based on the examples in the Debian wiki:

* https://wiki.debian.org/DebianInstaller/Preseed
* https://wiki.debian.org/DebianInstaller/Preseed/EditIso
