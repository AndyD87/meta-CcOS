git clone -b morty git://git.yoctoproject.org/poky.git yocto
cd yocto
git clone -b morty git://github.com/openembedded/meta-openembedded.git
git clone git://github.com/AndyD87/meta-CcOS.git

rm -rf build/conf

. ./oe-init-build-env

bitbake-layers add-layer ../meta
bitbake-layers add-layer ../meta-poky
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-networking
bitbake-layers add-layer ../meta-yocto-bsp
bitbake-layers add-layer ../meta-CcOS

cp ../meta-CcOS/conf/local.conf            conf/local.conf
