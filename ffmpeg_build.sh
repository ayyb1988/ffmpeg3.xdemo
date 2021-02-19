# 用于编译 android 平台的脚本,   使用的NDK版本是16 ffmpeg版本是3.3.9
#!/bin/bash
. ~/.bash_profile

# 定义几个变量
ARCH=arm
CPU=armv7-a
PREFIX=$(pwd)/android/$ARCH/$CPU
ANDROID_TOOLCHAINS_PATH=$NDK_PATH/android-toolchains/android-19/arm-arch
CROSS_PREFIX=$ANDROID_TOOLCHAINS_PATH/bin/arm-linux-androideabi-
SYSROOT=$ANDROID_TOOLCHAINS_PATH/sysroot

 build(){
	# 执行 .configure 文件
	./configure --prefix=${PREFIX} \
	--enable-gpl \
	--disable-static \
	--enable-shared \
	--enable-small \
	--disable-programs \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--arch=$ARCH \
	--cpu=$CPU \
	--cross-prefix=${CROSS_PREFIX} \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--target-os=linux \
	--extra-cflags="-fpic" \
 
	# makefile 清除，就是执行了 makefile 文件里面的 clean 命令
	make clean
	# 运行 Makefile
	make
	# 安装到指定 prefix 目录下
	make install
	# make clean
}

# 执行 build 函数
build






