DESCRIPTION = "CcOS framework"
HOMEPAGE = "https://coolcow.de"

SECTION = "examples"

LIC_FILES_CHKSUM = "file://COPYING;md5=4fe869ee987a340198fb0d54c55c47f1"
LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=bb3ca60759f3202f1ae42e3519cd06bc"
LICENSE = "LGPLv3"

S = "${WORKDIR}/git"

DEPENDS = "openssl"

SRC_URI = "git://github.com/AndyD87/CcOS.git;protocol=https;"

inherit pkgconfig cmake

# Uncomment if Debug is required for CcOS
# EXTRA_OECMAKE = " -DCMAKE_BUILD_TYPE=Debug"
