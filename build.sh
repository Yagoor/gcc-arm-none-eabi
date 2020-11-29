
# Install ARM toolchain
wget -nv https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2 && \
RUN tar xjf gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2 -C /tmp/
  ./install-sources.sh --skip_steps=mingw32
  ./build-prerequisites.sh --skip_steps=mingw32
  ./build-toolchain.sh --skip_steps=mingw32,manual,howto
