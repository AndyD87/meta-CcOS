#!/bin/bash

# include common methods requires bash
source "lib.common.sh"

if [ "$YOCTO_BRANCH" = "" ]; then
  export YOCTO_BRANCH=sumo
fi

source ../scripts/download.sh
source ../scripts/configure.sh
source ../scripts/build.sh
#source ../scripts/sdk.sh
#source  ../scripts/install.sh

# Change to build directory if source was done
cd ../build
