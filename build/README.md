# How to Build TensorFlow Lite Static Library

1. git clone tensorflow v2.18.0 from github, then apply all patches under patch diretory.

    ```bash
    cd <tensorflow_v2.18.0>
    git apply ../patch/*
    ```

2. Run `build_xxx.sh`. During the first compilation, all third-party dependencies will be automatically downloaded into build directory.

3. Then Locate these two header files in the third-party dependency Eigen:
    `eigen/Eigen/src/Core/util/Macros.h`
    `ml_dtypes/third_party/eigen/Eigen/src/Core/util/Macros.h`
   And modify `__ARM_ARCH >= 8` to `__ARM_ARCH >= 9` in these two header files.

4. Re-run `build_xxx.sh` to proceed the compilation.

5. Finally, `libtflite.a` under build directory is the self-contained static library that we need.
