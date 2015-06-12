#!/bin/bash


export TMPDIR="/Users/hpb/Documents/android"
export NDK="/Users/hpb/Documents/android/android-ndk-r10d"
SYSROOT=$NDK/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.6/prebuilt/darwin-x86_64
function build_one
{
./configure \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-avdevice \
--disable-doc \
--disable-symver \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=$CPU \
--cc=$TOOLCHAIN/bin/arm-linux-androideabi-gcc-4.6 \
--enable-cross-compile \
--enable-zlib  \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="-Wl,-T,$TOOLCHAIN/arm-linux-androideabi/lib/ldscripts/armelf_linux_eabi.x -Wl,-rpath-link=$SYSROOT/usr/lib -L$SYSROOT/usr/lib -nostdlib $TOOLCHAIN/lib/gcc/arm-linux-androideabi/4.6/crtbegin.o $TOOLCHAIN/lib/gcc/arm-linux-androideabi/4.6/crtend.o -lc -lm -lz -ldl" \
$ADDITIONAL_CONFIGURE_FLAG
}
CPU=arm
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-marm"
build_one