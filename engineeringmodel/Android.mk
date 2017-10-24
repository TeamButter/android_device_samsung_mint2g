#
# Copyright (C) Cswl Coldwind <cswl1337@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

# libengclient
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false

#LOCAL_CFLAGS += -DENG_API_LOG

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

# libeng_wifi_ptest
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false

#LOCAL_CFLAGS += -DENG_API_LOG

LOCAL_C_INCLUDES  += engopt.h \
	engapi.h

LOCAL_SRC_FILES :=  eng_wifi_ptest.c \
      bt_eut.c \
      wifi_eut.c

LOCAL_SHARED_LIBRARIES := libdl \
	liblog \
	libcutils

LOCAL_MODULE:= libeng_wifi_ptest
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
