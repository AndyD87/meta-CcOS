#!/bin/bash

# include common methods requires bash
source "lib.common.sh"

# nothing to install at the moment
exit 0;

################################################
# The next lines will package a raspberry image
################################################
CURRENT=$PWD
SRCDIR=$PWD/build/tmp/deploy/images/raspberrypi2
MIRROR_DIR=$PWD/mirror
INSTALL_DIR=$PWD/install
BOOT_FS_DIR=$INSTALL_DIR/boot_fs
SDK_DIR=$PWD/build/tmp/deploy/sdk
LICENSE_DIR=$PWD/build/tmp/deploy/licenses
MACHINE=raspberrypi2
IMAGE=ccos-image
DTBS="bcm2709-rpi-2-b.dtb \
      bcm2710-rpi-3-b.dtb \
      bcm2710-rpi-cm3.dtb"

rm -Rf $INSTALL_DIR

mkdir $INSTALL_DIR
mkdir $BOOT_FS_DIR

echo "Copying root-FileSystem files"
cp ${SRCDIR}/${IMAGE}-${MACHINE}.tar.xz $INSTALL_DIR/root_fs.tar.xz
exit_on_fail "install failed to copy root fs"


echo "Copying bootloader files"
cp ${SRCDIR}/bcm2835-bootfiles/* $BOOT_FS_DIR
exit_on_fail "install failed to copy bootloader files"

echo "Creating overlay directory"
mkdir $BOOT_FS_DIR/overlays

if [ $? -ne 0 ]; then
	echo "Error creating overlays directory"
	exit 1
fi

echo "Copying overlay dtbs"
cp  ${SRCDIR}/Image-*-overlay.dtb $BOOT_FS_DIR/overlays/

if [ $? -ne 0 ]; then
	echo "Error copying overlays"
	exit 1
fi

echo "Renaming overlay dtbs to dtbos"
rename 's/Image-([\w\-]+)-overlay.dtb/$1.dtbo/' $BOOT_FS_DIR/overlays/*.dtb

echo "Copying dtbs"
for f in ${DTBS}; do
	cp ${SRCDIR}/Image-${f} $BOOT_FS_DIR/${f}

	if [ $? -ne 0 ]; then
		echo "Error copying dtb: $f"
		exit 1
	fi
done

echo "Copying kernel"
if [ "${MACHINE}" = "raspberrypi2" ]; then
	cp ${SRCDIR}/Image $BOOT_FS_DIR/kernel7.img
else
	cp ${SRCDIR}/Image $BOOT_FS_DIR/kernel.img
fi

if [ $? -ne 0 ]; then
	echo "Error copying kernel"
	exit 1
fi

echo "Create Boot_Fs Package"
tar czf ${BOOT_FS_DIR}.tar.gz -C $BOOT_FS_DIR .
exit_on_fail "install failed to copy boot fs"

echo "Remove Boot_Fs Package"
rm -Rf $BOOT_FS_DIR

echo "Copy SD-Card creation script"
cp scripts/createSd.sh $INSTALL_DIR/
exit_on_fail "install failed no createSd.sh script"

echo "Copy SDK"
cp ${SDK_DIR}/*.sh $INSTALL_DIR/sdk.sh
exit_on_fail "install failed no sdk.sh"

echo "Copy CMAKE-File"
cp CrossCompile.cmake $INSTALL_DIR/
exit_on_fail "install failed to copy CrossCompile.cmake"

echo "Copy License and Packaging informations"
cp -Rf $LICENSE_DIR/${IMAGE}-${MACHINE}* $INSTALL_DIR
exit_on_fail "install failed to copy licenses"

echo "Copy Package mirror"
tar czf $INSTALL_DIR/mirror.tar.gz -C $MIRROR_DIR .
exit_on_fail "install failed to create mirror package"
