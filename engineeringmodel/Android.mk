
# libengclient
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false

#LOCAL_CFLAGS += -DENG_API_LOG

LOCAL_SHARED_LIBRARIES := libcutils

LOCAL_C_INCLUDES  += engopt.h \
	engapi.h

LOCAL_SRC_FILES :=  engopt.c \
	engapi.c \
	eng_attok.c \
	engparcel.c \
	engclient.c \
	eng_common.c \
	eng_modemclient.c \
	engphasecheck.c \
	eng_appclient.c

LOCAL_SHARED_LIBRARIES := libdl \
	liblog \
	libcutils

LOCAL_MODULE:= libengclient
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# engservice
include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  engservice.c \
	fdevent.c \

LOCAL_SHARED_LIBRARIES := libengclient \
	liblog \
	libcutils

LOCAL_MODULE:= engservice
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

# engsetmacaddr
include $(CLEAR_VARS)

LOCAL_SRC_FILES := eng_setbtwifiaddr.c

LOCAL_SHARED_LIBRARIES :=   liblog \
  							libcutils \
  							libengclient

LOCAL_MODULE:= engsetmacaddr
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)


# engpcclient
include $(CLEAR_VARS)

LOCAL_SRC_FILES := eng_pcclient.c \
  eng_appclient.c \
  eng_cmd4linuxhdlr.c \
  eng_diag.c \
  eng_sqlite.c \
  bt_eut.c \
  gps_eut.c \
  wifi_eut.c \
  backlight.c \
  eng_testhardware.c \
  eng_sd_log.c \
  crc16.c \
  vdiag.c \
  vlog.c

LOCAL_SHARED_LIBRARIES :=   liblog \
	libcutils \
	libengclient \
	libsqlite

LOCAL_MODULE:= engpcclient
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

# engmodemclient
include $(CLEAR_VARS)

LOCAL_SRC_FILES := eng_modemclient.c \
  engparcel.c

LOCAL_SHARED_LIBRARIES :=   liblog \
	libcutils \
	libengclient

LOCAL_MODULE:= engmodemclient
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
