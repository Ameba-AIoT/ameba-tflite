# TensorFlow Lite for Ameba SoCs

## Overview

TensorFlow Lite (LiteRT) is Google's on-device framework for high-performance ML & GenAI deployment on edge platforms, using efficient conversion, runtime, and optimization.

This repository is a version of the [TensorFlow Lite library](https://ai.google.dev/edge/litert) for Realtek Ameba SoCs.

Documentation: [ameba-tflite](https://aiot.realmcu.com/en/latest/linux/ai/tfl/index.html)

## Getting Started

### Build Tensorflow Lite Example

This repository include two demo examples:

**Minimal**: A minimal example to demonstrate how to use TensorFlow Lite with Ameba SoCs. Refer to [Minimal](examples/minimal/).

**Label Image**: An image classification example to demonstrate how to run an image model on Ameba SoCs. Refer to [Label Image](examples/label_image/).

## Version Info

This repository has been built from [TensorFlow Lite v2.18.0](https://github.com/tensorflow/tensorflow/tree/v2.18.0).

## License

This repository is provided under Apache 2.0 license, see [LICENSE](LICENSE) file for details.

TensorFlow library source code and third_party code contain their own licenses specified under respective repos.
