# Local Debian Image

This is a demo of how to rebuild a Debian ISO image to perform a fully automated
installation.  It's a companion to [this blog
post](https://grumpy.systems/2021/custom-debian-iso/).

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

## Install Scripts

As an extra feature of this ISO, you are able to create scripts that are
executed automatically at the end of the installation.  Just by adding more
scripts into `install.d`, you can add more.  An example that installs Git is
included.

## Upstream Reference

The procedure used here (along with the preseed file) is based on the examples
in the Debian wiki:

* https://wiki.debian.org/DebianInstaller/Preseed
* https://wiki.debian.org/DebianInstaller/Preseed/EditIso

## Assumptions Made

This image is built with a couple of assumptions:

1) The installation is completely automated, and will overwrite the first hard
   drive the system sees (`/dev/sda`).
2) The hostname and domain name will be set via the DHCP hostname.  This can be
   changed after installation, but during installation no option is presented.
2) The image is not designed to be written to actual media like a CD or USB
   drive.  It's sole purpose is to boot virtual machines.  _In Theory_ it can be
   written to a plain CD, but this has never been tested.

## Fully Automated vs Semi-Automated

This code, as it sits, will prompt you for a username and password and disable
the root account.  If you prefer to have nothing asked and set an insecure
password, add these to the `preseed.cfg` file:

```
d-i passwd/username string debian
d-i passwd/user-password password debian
d-i passwd/user-password-again password debian
d-i passwd/user-fullname string debian
```

Replace the lines with values you want, and be sure to change the password after
the install is finished!
