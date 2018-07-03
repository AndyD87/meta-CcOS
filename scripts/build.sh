#!/bin/bash

# include common methods requires bash
source "lib.common.sh"

cd ..

if [ "$YOCTO_BRANCH" = "" ] ; then
  echo "ERROR: Yocto branch not defined"
  exit -1
fi


source poky-$YOCTO_BRANCH/oe-init-build-env
# now we have to copy our config to build
cp ../conf/* conf/

# start building
bitbake ccos-image

# list all recipes
#bitbake-layers show-recipes

exit_on_fail "Bitbake returned error $?"
