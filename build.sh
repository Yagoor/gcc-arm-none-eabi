#!/bin/bash

wget -v https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-src.tar.bz2
tar xjf gcc-arm-none-eabi-10.3-2021.10-src.tar.bz2
cd gcc-arm-none-eabi-10.3-2021.10

# Change date to match arm release
sed -i 's/.*RELEASEDATE=.*/RELEASEDATE=20211001/'  build-common.sh
sed -i 's/.*release_year=.*/release_year=2021/'  build-common.sh
sed -i 's/.*release_month=.*/release_month=10/'  build-common.sh
sed -i 's/.*host_arch=.*/host_arch="i386"/'  build-common.sh

./install-sources.sh --skip_steps=mingw32
./build-prerequisites.sh --skip_steps=mingw32,howto
./build-toolchain.sh --skip_steps=mingw32,manual,howto