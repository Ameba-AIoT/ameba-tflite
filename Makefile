#
# Realtek Semiconductor Corp.
#

CROSS_COMPILE ?= arm-linux-

CC := $(CROSS_COMPILE)gcc
CXX := $(CROSS_COMPILE)g++
LD := $(CROSS_COMPILE)gcc
AR := $(CROSS_COMPILE)ar
RANLIB := $(CROSS_COMPILE)ranlib
O ?= $(shell pwd)

TFLITE_DIR := .

TFLITE_LIB := -L$(TFLITE_DIR)/lib/rtl8730e_ca32_linux -ltensorflow-lite
TFLITE_INC := -I$(TFLITE_DIR)/inc/ -I$(TFLITE_DIR)/inc/flatbuffers/include

EXAMPLE_NAME := minimal # label_image or minimal

EXAMPLE_INC :=
EXAMPLE_FLAG :=
EXAMPLE_SRC :=

include $(TFLITE_DIR)/examples/$(EXAMPLE_NAME)/Makefile

exe-y = rtk_tflite_algo

all: $(O)/$(exe-y)

$(O)/$(exe-y):
	$(CC) $(CFLAGS) $(EXAMPLE_FLAG) $(EXAMPLE_INC) $(TFLITE_INC) $(TFLITE_LIB) $(LDFLAGS) $(EXAMPLE_SRC) $(TFLITE_LIB) -lstdc++ -lm -o $@

clean:
	-rm -f $(O)/*
