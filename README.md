# buildroot-tree
Buildroot development tree

## Boards

Following custom boards are supported:
- Raspberry Pi 3 64-bit (4.11.x, 4.11.x-RT and 4.9.x-RT kernels);
- Raspberry Pi 3 32-bit (4.11.x, 4.11.x-RT, 4.9.x-RT and rpi-4.1.y-ipipe kernels).

## How to use

Untar the buildroot package:
* tar -xjvf dl/buildroot-2017.05.tar.bz2
* cd buildroot-2017.05
* patch -p1 < board/raspberry3/patches/buildroot-2017.05-genimage.patch
* patch -p1 < board/raspberry3/patches/buildroot-2017.05-xenomai.patch
* patch -p1 < board/raspberry3-64/patches/buildroot-2017.05-genimage.patch

Build a toolchain:
* For 32-bit: cp ../board/raspberrypi3/001-buildroot-toolchain.cfg ./.config && make
* For 64-bit: cp ../board/raspberrypi3-64/001-buildroot-toolchain.cfg ./.config && make

Note: to build a Xenomai system (only for 32-bit), you need a toolchain with 4.1 kernel headers:
* cp ../board/raspberrypi3/006-buildroot-toolchain-4.1.cfg ./.config && make

Once done, copy a configuration to build a system:
* Example for 32-bit: cp ../board/raspberrypi3/002-buildroot-minimal.cfg ./.config && make
* Example for 64-bit: cp ../board/raspberrypi3-64/002-buildroot-minimal.cfg ./.config && make

Build the system:
* make

Installation:
* Partition your SD card with three partitions (for /boot, / and /home) with fdisk;
* Uses vfat for /boot, ext4 for / and vfat for /home;
* Be sure your SD card is /dev/mmcblk0 and launch ../scripts/install_sd.sh.

## Configurations

For 32-bit and 64-bit:
* 002-minimal.cfg: very minimal system (serial, login, ...);
* 003-buildroot-ovl-users-devices-ssh.cfg: basic system (ssh, 1 user, special permissions, fstab, load /etc/modules, ...).
* 004-buildroot-rt.cfg: same as 003-buildroot-ovl-users-devices-ssh.cfg but with a 4.9.x kernel with PREEMPT-RT patch as well as rt-tests and ltp packages;

For 32-bit only:
* 005-buildroot-xenomai.cfg: same as 003-buildroot-ovl-users-devices-ssh.cfg but with rpi-4.1.y-ipipe kernel with Xenomai.

## Links

* https://buildroot.org/downloads/manual/manual.html

