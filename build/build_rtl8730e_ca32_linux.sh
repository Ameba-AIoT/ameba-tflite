mkdir build_rtl8730e_ca32_linux
cd build_rtl8730e_ca32_linux

TOOLCHAIN_CMAKE=../rtl8730x_linux.cmake
cmake -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_CMAKE} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DTFLITE_ENABLE_XNNPACK=OFF -DTFLITE_ENABLE_RUY=ON -DTFLITE_C_BUILD_SHARED_LIBS=OFF ../tensorflow/lite/c

cmake --build .

/opt/yocto/toolchain/gcc-yocto-11.3.0-a32hf-neon-arm-linux-gnueabi/sysroots/x86_64-rtksdk-linux/usr/bin/arm-rtk-linux-gnueabi/arm-rtk-linux-gnueabi-ar -M <libx.mri
/opt/yocto/toolchain/gcc-yocto-11.3.0-a32hf-neon-arm-linux-gnueabi/sysroots/x86_64-rtksdk-linux/usr/bin/arm-rtk-linux-gnueabi/arm-rtk-linux-gnueabi-ranlib ./libtflite.a
