LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libopusfile

LOCAL_SDK_VERSION := 19

LOCAL_CFLAGS := -DHAVE_CONFIG_H \
    -ffast-math -fsigned-char -O2 -fPIC -DPIC \
    -DBYTE_ORDER=LITTLE_ENDIAN

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/opusfile \
    $(LOCAL_PATH)/opusfile/include \
    $(LOCAL_PATH)/opusfile/src

LOCAL_SRC_FILES := \
    $(LOCAL_PATH)/opusfile/src/

ifeq ($(strip $(TARGET_ARCH)),arm)
    LOCAL_CFLAGS += -DCPU_ARM -D_ARM_ASSEM_
endif

ifeq ($(strip $(TARGET_ARCH)),x86)
    LOCAL_CFLAGS += -DCPU_X86
endif

ifeq ($(strip $(TARGET_ARCH)),arm64)
    LOCAL_CFLAGS += -DCPU_ARM -D_ARM_ASSEM_
endif

ifeq ($(strip $(TARGET_ARCH)),x86_64)
    LOCAL_CFLAGS += -DCPU_X86
endif

include $(BUILD_STATIC_LIBRARY)
