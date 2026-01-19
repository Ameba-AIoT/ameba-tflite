mkdir build_rtl8730e_ca32_linux
cd build_rtl8730e_ca32_linux

TOOLCHAIN_CMAKE=../build/rtl8730x_linux.cmake

PATH_TO_PROTOCO=../build_x86_64_linux/_deps/protobuf-build/protoc  # Path to the protoc executable built for HOST PC

cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_CMAKE} -Dprotobuf_BUILD_PROTOC_BINARIES=OFF -DProtobuf_PROTOC_EXECUTABLE=${PATH_TO_PROTOCO} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DTFLITE_ENABLE_XNNPACK=OFF -DTFLITE_ENABLE_RUY=ON -DTFLITE_C_BUILD_SHARED_LIBS=OFF ../tensorflow/lite/c

cmake --build . -j8

/opt/yocto/toolchain/gcc-yocto-11.3.0-a32hf-neon-arm-linux-gnueabi/sysroots/x86_64-rtksdk-linux/usr/bin/arm-rtk-linux-gnueabi/arm-rtk-linux-gnueabi-ar -M <../build/libx.mri
/opt/yocto/toolchain/gcc-yocto-11.3.0-a32hf-neon-arm-linux-gnueabi/sysroots/x86_64-rtksdk-linux/usr/bin/arm-rtk-linux-gnueabi/arm-rtk-linux-gnueabi-ranlib ./libtflite.a

#cmake --build . -j8 -t benchmark_model