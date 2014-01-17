# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.ccrg/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
include external/stlport/libstlport.mk
LOCAL_CPP_EXTENSION := .cc

# measurements show that the ARM version of ZLib is about x1.17 faster
# than the thumb one...
# LOCAL_ARM_MODE := arm

	
nmap_files := charpool.cc idle_scan.cc nmap_error.cc nmap_tty.cc payload.cc scan_engine.cc Target.cc traceroute.cc FingerPrintResults.cc  MACLookup.cc  nmap.cc osscan2.cc portlist.cc service_scan.cc targets.cc utils.cc FPEngine.cc            main.cc NmapOps.cc osscan.cc portreasons.cc services.cc tcpip.cc xml.cc FPModel.cc nmap_dns.cc NmapOutputTable.cc output.cc protocols.cc TargetGroup.cc timing.cc

LOCAL_SRC_FILES := $(nmap_files)
LOCAL_MODULE :=  nmap
LOCAL_CFLAGS := -O3 -DANDROID -DHAVE_CONFIG_H -DNOLUA -lsupc++
LOCAL_CFLAGS += -DNMAP_NAME=\"Nmap\" -DNMAP_URL=\"http://nmap.ccrg\" -DNMAP_PLATFORM=\"x86_64-unknown-linux-gnu\" -DNMAPDATADIR=\"/system/usr/local/share/nmap\" 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../gmp/$(TARGET_ARCH_VARIANT) \
		    $(LOCAL_PATH) \
		    $(LOCAL_PATH)/../openssl/include \
		    $(LOCAL_PATH)/liblinear \
		    $(LOCAL_PATH)/libpcap \
		    $(LOCAL_PATH)/libpcre \
		    $(LOCAL_PATH)/nbase \
		    $(LOCAL_PATH)/libdnet-stripped/include \
		    $(LOCAL_PATH)/nsock/include

LOCAL_SHARED_LIBRARIES += libc   liblinear libpcap libssl  libcrypto libnsock libnbase libnetutil libdnet libpcre
LOCAL_LDFLAGS:= $(TOOL_LDFLAGS) -lstdc++ -lc

#LOCAL_SHARED_LIBRARIES :=  libstlport liblinear libpcap libssl  libcrypto libnsock libnbase libnetutil libdnet libpcre
#include external/stlport/libstlport.mk
include abi/cpp/use_rtti.mk
SYSROOT := out/target/product/anzu/system
#LOCAL_STL                 := gnustl_shared
#LOCAL_CPPFLAGS            += -fexceptions
#LOCAL_CPPFLAGS            += -frtti
LOCAL_CPPFLAGS            += -lsupc++ -lstdc++
#APP_STL := stlport_static
#LOCAL_STL                 := gnustl_shared

$(info SYSROOT     = $(SYSROOT))
include $(BUILD_EXECUTABLE)
