# TensorFlow Lite C++ minimal example

This example shows how you can build a simple TensorFlow Lite application.

#### Build the executable

First modify the `EXAMPLE_NAME` in `Makefile`.
The default is `minimal`. If you want to build another example, change it to that name.

Then run the following commands to build the example:

```sh
cd <amebalinux_sdk>/
. ./envsetup.sh
bitbake rtk-tflite-algo
```

After building, you can find the executable file: `build_rtl8730elh-va7-full/tmp/work/rtl8730elh_va7-rtk-linux-gnueabi/rtk-tflite-algo/1.0/image/bin/rtk_tflite_algo`.


#### Run the executable

Push the executable `minimal` and the model to your device, then run it with:

```sh
./minimal <path/to/tflite/model>
```
