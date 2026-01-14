mkdir build_x86_64_linux
cd build_x86_64_linux

cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DTFLITE_ENABLE_XNNPACK=OFF ../tensorflow/lite/c

cmake --build . -j16

ar -M <libx.mri
ranlib ./libtflite.a
