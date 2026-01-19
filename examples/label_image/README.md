# TensorFlow Lite C++ image classification demo

This example shows how you can load a pre-trained and converted
TensorFlow Lite model and use it to recognize objects in images.

## Build the example

First modify the `EXAMPLE_NAME` in `Makefile`.
The default is `minimal`. If you want to build label_image, change it to `label_image`.

Then run the following commands to build the example:

```sh
cd <amebalinux_sdk>/
. ./envsetup.sh
bitbake rtk-tflite-algo
```

After building, you can find the executable file: `build_rtl8730elh-va7-full/tmp/work/rtl8730elh_va7-rtk-linux-gnueabi/rtk-tflite-algo/1.0/image/bin/rtk_tflite_algo`.

## Download sample model and image

You can use any compatible model, but the following MobileNet v1 model offers
a good demonstration of a model trained to recognize 1,000 different objects.

```sh
# Get model
curl https://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz | tar xzv -C ./tmp

# Get labels
curl https://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_1.0_224_frozen.tgz  | tar xzv -C ./tmp  mobilenet_v1_1.0_224/labels.txt

mv ./tmp/mobilenet_v1_1.0_224/labels.txt ./tmp/
```

## Run the sample on device

Prepare data on devices, e.g.,

```sh
adb push build_rtl8730elh-va7-full/tmp/work/rtl8730elh_va7-rtk-linux-gnueabi/rtk-tflite-algo/1.0/image/bin/rtk_tflite_algo  /data/local/tmp
adb push tmp/mobilenet_v1_1.0_224.tflite  /data/local/tmp
adb push examples/label_image/testdata/grace_hopper.bmp  /data/local/tmp
adb push tmp/labels.txt /data/local/tmp
```

Run it,

```sh
adb shell "/data/local/tmp/label_image \
    -m /data/local/tmp/mobilenet_v1_1.0_224.tflite \
    -i /data/local/tmp/grace_hopper.bmp \
    -l /data/local/tmp/labels.txt"
```

then you should see something like the following:

```
Loaded model /data/local/tmp/mobilenet_v1_1.0_224.tflite
resolved reporter
INFO: Initialized TensorFlow Lite runtime.
invoked
average time: 25.03 ms
0.907071: 653 military uniform
0.0372416: 907 Windsor tie
0.00733753: 466 bulletproof vest
0.00592852: 458 bow tie
0.00414091: 514 cornet
```

With `-h` or any other unsupported flags, `label_image` will list supported
options:

```sh
sargo:/data/local/tmp $ ./label_image -h
./label_image: invalid option -- h
label_image
--accelerated, -a: [0|1], use Android NNAPI or not
--old_accelerated, -d: [0|1], use old Android NNAPI delegate or not
--allow_fp16, -f: [0|1], allow running fp32 models with fp16 or not
--count, -c: loop interpreter->Invoke() for certain times
--gl_backend, -g: [0|1]: use GPU Delegate on Android
--hexagon_delegate, -j: [0|1]: use Hexagon Delegate on Android
--input_mean, -b: input mean
--input_std, -s: input standard deviation
--image, -i: image_name.bmp
--labels, -l: labels for the model
--tflite_model, -m: model_name.tflite
--profiling, -p: [0|1], profiling or not
--num_results, -r: number of results to show
--threads, -t: number of threads
--verbose, -v: [0|1] print more information
--warmup_runs, -w: number of warmup runs
--xnnpack_delegate, -x [0:1]: xnnpack delegate`
```

See the `label_image.cc` source code for other command line options.

Note that this binary doesn't support XNNPACK delegate or Hexagon delegate or GPU delegate on Android, since they are not built into TensorFlow Lite library.
