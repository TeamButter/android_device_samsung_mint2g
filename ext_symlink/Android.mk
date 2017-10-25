# Copyright 2005 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

ext_cflags += \
    -Wall -Wextra \
    -Wno-unused-parameter \

include $(CLEAR_VARS)
LOCAL_CFLAGS := $(ext_cflags)
LOCAL_SRC_FILES:= \
    ext_symlink.c \

LOCAL_MODULE := ext_symlink
LOCAL_CLANG := true

LOCAL_SHARED_LIBRARIES := libcutils \
  liblog

include $(BUILD_EXECUTABLE)