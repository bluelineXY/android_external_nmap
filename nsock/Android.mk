# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# measurements show that the ARM version of ZLib is about x1.17 faster
# than the thumb one...
LOCAL_ARM_MODE := arm

nsock_SOURCES = \
src/engine_epoll.c \
src/engine_kqueue.c \
src/engine_poll.c \
src/engine_select.c \
src/error.c \
src/filespace.c \
src/gh_list.c \
src/netutils.c \
src/nsock_connect.c \
src/nsock_core.c \
src/nsock_engines.c \
src/nsock_event.c \
src/nsock_iod.c \
src/nsock_log.c \
src/nsock_pcap.c \
src/nsock_pool.c \
src/nsock_proxy.c \
src/nsock_read.c \
src/nsock_ssl.c \
src/nsock_timers.c \
src/nsock_write.c \
src/proxy_http.c \
src/proxy_socks4.c

LOCAL_SRC_FILES := $(nsock_SOURCES)
LOCAL_MODULE :=  libnsock
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
$(info LOCAL_SRC_FILES     = $(LOCAL_SRC_FILES))
LOCAL_CFLAGS += -O3 -DUSE_MMAP -DHAVE_CONFIG_H

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../gmp/$(TARGET_ARCH_VARIANT) \
                    $(LOCAL_PATH) \
                    $(LOCAL_PATH)/../nbase \
		    $(LOCAL_PATH)/../libpcap \
                    $(LOCAL_PATH)/../../openssl/include \
                    $(LOCAL_PATH)/../nsock/include
LOCAL_SHARED_LIBRARIES := libcrypto libssl libnbase libpcap
include $(BUILD_SHARED_LIBRARY)
