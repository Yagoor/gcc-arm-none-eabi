#!/bin/bash

wget -v https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-src.tar.bz2
tar xjf gcc-arm-none-eabi-10.3-2021.10-src.tar.bz2
cd gcc-arm-none-eabi-10.3-2021.10
./install-sources.sh --skip_steps=mingw32
./build-prerequisites.sh --skip_steps=mingw32,howto
./build-toolchain.sh --skip_steps=mingw32,manual,howto