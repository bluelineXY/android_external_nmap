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
LOCAL_CPP_EXTENSION := .cc

# measurements show that the ARM version of ZLib is about x1.17 faster
# than the thumb one...
LOCAL_ARM_MODE := arm

# nmap_files := charpool.cc FingerPrintResults.cc FPEngine.cc FPModel.cc idle_scan.cc MACLookup.cc main.cc nmap.cc nmap_dns.cc nmap_error.cc NmapOps.cc NmapOutputTable.cc nmap_tty.cc osscan2.cc osscan.cc output.cc payload.cc portlist.cc portreasons.cc protocols.cc scan_engine.cc service_scan.cc services.cc Target.cc TargetGroup.cc targets.cc tcpip.cc timing.cc traceroute.cc utils.cc xml.cc
	
libnetutil_files := \
 ARPHeader.cc \
DestOptsHeader.cc \
EthernetHeader.cc \
FragmentHeader.cc \
HopByHopHeader.cc \
ICMPv4Header.cc \
ICMPv6Header.cc \
ICMPv6Option.cc \
ICMPv6RRBody.cc \
IPv4Header.cc \
IPv6Header.cc \
netutil.cc \
NetworkLayerElement.cc \
PacketElement.cc \
PacketParser.cc \
RawData.cc \
RoutingHeader.cc \
TCPHeader.cc \
TransportLayerElement.cc \
UDPHeader.cc 


#nmap_files := main.cc charpool.cc FingerPrintResults.cc FPEngine.cc FPModel.cc idle_scan.cc MACLookup.cc nmap.cc nmap_dns.cc nmap_error.cc NmapOps.cc NmapOutputTable.cc nmap_tty.cc osscan2.cc osscan.cc output.cc payload.cc portlist.cc portreasons.cc protocols.cc scan_engine.cc service_scan.cc services.cc Target.cc TargetGroup.cc targets.cc tcpip.cc timing.cc traceroute.cc utils.cc xml.cc nse_main.cc nse_utility.cc nse_nsock.cc nse_dnet.cc nse_fs.cc nse_nmaplib.cc nse_debug.cc nse_pcrelib.cc nse_binlib.cc nse_bit.cc nse_openssl.cc nse_ssl_cert.cc

LOCAL_SRC_FILES := $(libnetutil_files)
LOCAL_MODULE :=  libnetutil
LOCAL_CFLAGS := -O3 -DHAVE_CONFIG_H -DNOLUA -DANDROID  -DNDEBUG -UDEBUG -DCHECKOPTS
LOCAL_CFLAGS += -DNMAP_NAME=\"Nmap\" -DNMAP_URL=\"http://nmap.org\" -DNMAP_PLATFORM=\"x86_64-unknown-linux-gnu\" -DNMAPDATADIR=\"/usr/local/share/nmap\" 
APP_CPPFLAGS += -frtti 
APP_CPPFLAGS += -fexceptions

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../gmp/$(TARGET_ARCH_VARIANT) \
		    $(LOCAL_PATH) \
		    $(LOCAL_PATH)/../openssl/include \
		    $(LOCAL_PATH)/liblinear \
		    $(LOCAL_PATH)/../libpcap \
		    $(LOCAL_PATH)..//libpcre \
		    $(LOCAL_PATH)/../nbase \
		    $(LOCAL_PATH)/../libdnet-stripped/include \
		    external/stlport/stlport \
		    $(LOCAL_PATH)/nsock/include


LOCAL_SHARED_LIBRARIES := libc  libpcap libssl  libcrypto libnsock libnbase libdnet libicuuc 
include external/stlport/libstlport.mk
include $(BUILD_SHARED_LIBRARY)

