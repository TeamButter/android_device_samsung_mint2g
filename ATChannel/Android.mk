LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	ATChannel.c 

LOCAL_CFLAGS := -DLOG_TAG=\"ATChannel\"

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	liblog \
	libutils

LOCAL_MODULE := ATChannel

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
