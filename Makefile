all:
	@echo "Todo: Print Helper"

docker:
	docker build --tag gcc-arm-none-eabi-i386-builder:1.0 .
	docker run --mount type=bind,source=$$PWD,destination=/home/user -ti gcc-arm-none-eabi-i386-builder:1.0

gcc: gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2 gcc-arm-none-eabi-9-2020-q2-update install-sources build-prerequisites build-toolchain gcc-arm-none-eabi-9-2020-q2-update-i386-linux.tar.bz2

gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2:
	wget -nv https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2

gcc-arm-none-eabi-9-2020-q2-update:
	tar xjf gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2

install-sources:
	cd gcc-arm-none-eabi-9-2020-q2-update && \
	./install-sources.sh --skip_steps=mingw32 && \
	cd ..	&& \
	touch install-sources

build-prerequisites:
	cd gcc-arm-none-eabi-9-2020-q2-update && \
	./build-prerequisites.sh --skip_steps=mingw32 && \
	cd ..	&& \
	touch build-prerequisites

build-toolchain:
	cd gcc-arm-none-eabi-9-2020-q2-update && \
	./build-toolchain.sh --skip_steps=mingw32,manual && \
	cd ..	&& \
	touch build-toolchain

gcc-arm-none-eabi-9-2020-q2-update-i386-linux.tar.bz2:
	mkdir tmp && \
	cd tmp && \
	mkdir gcc-arm-none-eabi-9-2020-q2-update && \
	cp -r ../gcc-arm-none-eabi-9-2020-q2-update/install-native/* gcc-arm-none-eabi-9-2020-q2-update/ && \
	tar -cvjSf ../gcc-arm-none-eabi-9-2020-q2-update-i386-linux.tar.bz2 gcc-arm-none-eabi-9-2020-q2-update && \
	cd .. && \
	rm -rf tmp

clean:
	rm -rf gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2 gcc-arm-none-eabi-9-2020-q2-update install-sources build-prerequisites build-toolchain
