# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.crg/licenses/LICENSE-2.0
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

libpcre_SOURCES = \
pcre_compile.c pcre_config.c pcre_dfa_exec.c pcre_exec.c pcre_fullinfo.c pcre_get.c pcre_globals.c pcre_info.c pcre_maketables.c pcre_newline.c pcre_ord2utf8.c pcre_refcount.c pcre_study.c pcre_tables.c pcre_try_flipped.c pcre_ucp_searchfuncs.c pcre_valid_utf8.c pcre_version.c pcre_xclass.c pcre_chartables.c

LOCAL_SRC_FILES := $(libpcre_SOURCES)
LOCAL_MODULE :=  libpcre
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../gmp/$(TARGET_ARCH_VARIANT) \
                    $(LOCAL_PATH) \
                    $(LOCAL_PATH)/include

$(info LOCAL_SRC_FILES     = $(LOCAL_SRC_FILES))
LOCAL_CFLAGS += -O3 -DUSE_MMAP -DHAVE_CONFIG_H
include $(BUILD_SHARED_LIBRARY)
