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

nbase_SOURCES = \
nbase_addrset.c  \
nbase_memalloc.c  \
nbase_misc.c  \
nbase_rnd.c  \
nbase_str.c  \
nbase_time.c  


LOCAL_SRC_FILES := $(nbase_SOURCES)
LOCAL_MODULE :=  libnbase
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
$(info LOCAL_SRC_FILES     = $(LOCAL_SRC_FILES))
LOCAL_CFLAGS += -O3 -DUSE_MMAP -DHAVE_CONFIG_H
include $(BUILD_SHARED_LIBRARY)
