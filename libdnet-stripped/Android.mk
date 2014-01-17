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

libdnet_SOURCES = \
src/err.c \
src/eth-linux.c \
src/fw-none.c \
src/addr.c  \
src/addr-util.c \
src/arp-ioctl.c \
src/intf.c \
src/ip6.c \
src/ip.c \
src/ip-util.c \
src/memcmp.c \
src/rand.c \
src/route-linux.c \
src/tun-linux.c 


LOCAL_SRC_FILES := $(libdnet_SOURCES)
LOCAL_MODULE :=  libdnet
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../gmp/$(TARGET_ARCH_VARIANT) \
                    $(LOCAL_PATH) \
                    $(LOCAL_PATH)/include

$(info LOCAL_SRC_FILES     = $(LOCAL_SRC_FILES))
LOCAL_CFLAGS += -O3 -DUSE_MMAP -DHAVE_CONFIG_H
include $(BUILD_SHARED_LIBRARY)
