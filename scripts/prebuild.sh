################################################################################
# User Specific prebuild Tools and updates
################################################################################
sudo apt-get update
sudo apt-get upgrade

################################################################################
# Building the Ubuntu-Yocto environment
################################################################################
# install build system
sudo apt-get install build-essential chrpath diffstat gawk git libncurses5-dev pkg-config subversion texi2html texinfo python2.7 python-html5lib python-pip
# link python2.7 to default python
sudo ln -sf /usr/bin/python2.7 /usr/bin/python
# use bash as common shell @tod
sudo dpkg-reconfigure bash
