DESCRIPTION = "CcOS framework"
SECTION = "examples"
LICENSE = "GPLv2"
PR = "r0"

DEPENDS = "openssl"

SRCREV="${AUTOREV}"

SRC_URI = "git://github.com/AndyD87/CcOS.git;protocol=https;"

S = "${WORKDIR}/git"

inherit pkgconfig cmake

