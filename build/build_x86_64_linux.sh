mkdir build_x86_64_linux
cd build_x86_64_linux

cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DTFLITE_ENABLE_XNNPACK=OFF -DTFLITE_C_BUILD_SHARED_LIBS=OFF ../tensorflow/lite/c

cmake --build . -j8

ar -M <../build/libx.mri
ranlib ./libtflite.a

#cmake --build . -t benchmark_model -j8