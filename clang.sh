#! /bin/bash
#env
#clang版本11 , binutils版本2.27
export ARCH=arm64
export SUBARCH=arm64
export PATH="/home/kfa/binutils-2.41/bin:/home/kfa/clang-r487747c/bin:$PATH"



args="-j$(nproc --all) \
ARCH=arm64 \
SUBARCH=arm64 \
O=out \
CC=clang \
HOSTCC=clang \
CROSS_COMPILE=aarch64-linux-gnu- \
CROSS_COMPILE_COMPAT=arm-linux-gnueabi- \
CLANG_TRIPLE=aarch64-linux-gnu- \
LD=ld.lld \
AR=llvm-ar \
NM=llvm-nm \
OBJCOPY=llvm-objcopy \
OBJDUMP=llvm-objdump \
READELF=llvm-readelf \
OBJSIZE=llvm-size \
STRIP=llvm-strip \
LLVM=1 \
LLVM_IAS=1 "

#clean
make clean && make mrproper
rm kernel.log && rm -rf out 
mkdir -p out

#build
#make ${args} vendor/xxxx_defconfig
make ${args} ruby_user_defconfig
make ${args} 2>&1 | tee kernel.log

