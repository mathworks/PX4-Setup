#!/bin/bash

## Bash script for setting up a PX4 development environment on Ubuntu LTS (16.04).
## It can be used for installing simulators (only) or for installing the preconditions for Snapdragon Flight or Raspberry Pi.
##
## Installs:
## - Common dependencies and tools for all targets (including: Ninja build system, Qt Creator, pyulog)
## - jMAVSim simulator dependencies

# Preventing sudo timeout https://serverfault.com/a/833888
trap "exit" INT TERM; trap "kill 0" EXIT; sudo -v || exit $?; sleep 1; while true; do sleep 60; sudo -nv; done 2>/dev/null &

# Ubuntu Config
echo "We must first remove modemmanager"
sudo apt-get remove modemmanager -y


# Common dependencies
echo "Installing common dependencies"
sudo apt-get update -y
sudo apt-get install git zip qtcreator cmake build-essential genromfs ninja-build -y
# Required python packages
sudo apt-get install python-argparse python-empy python-toml python-numpy python-dev python-pip -y
sudo -H pip install --upgrade pip
#hash -d pip
sudo -H pip install pandas jinja2 pyserial
sudo apt-get install python-jinja2
# optional python tools
sudo -H pip install pyulog

# jMAVSim simulator dependencies
echo "Installing jMAVSim simulator dependencies"
sudo apt-get install ant openjdk-8-jdk openjdk-8-jre -y

# NuttX
sudo apt-get install python-serial openocd \
    flex bison libncurses5-dev autoconf texinfo \
    libftdi-dev libtool zlib1g-dev -y

# Clean up old GCC
sudo apt-get remove gcc-arm-none-eabi gdb-arm-none-eabi binutils-arm-none-eabi gcc-arm-embedded -y
sudo add-apt-repository --remove ppa:team-gcc-arm-embedded/ppa -y


# GNU Arm Embedded Toolchain: 7-2017-q4-major December 18, 2017
gcc_dir=$HOME/gcc-arm-none-eabi-7-2017-q4-major
echo "Installing GCC to: $gcc_dir"
if [ -d "$gcc_dir" ]
then
    echo " GCC already installed."
else
    pushd .
    cd ~    
    wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2
    tar -jxf gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2
    exportline="export PATH=$HOME/gcc-arm-none-eabi-7-2017-q4-major/bin:\$PATH"
    if grep -Fxq "$exportline" ~/.profile; then echo " GCC path already set." ; else echo $exportline >> ~/.profile; fi
    . ~/.profile
    popd
fi
