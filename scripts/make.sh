#!/bin/bash

# include common methods requires bash
source "lib.common.sh"

if [ "$YOCTO_BRANCH" = "" ]; then
  export YOCTO_BRANCH=sumo
fi

./download.sh
./configure.sh
./build.sh
exit_on_fail "build failed"
#./sdk.sh
#./install.sh
