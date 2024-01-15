ifneq ($(PREBUILT_FSL_IMX_GPU),true)
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := gpu-top

LOCAL_C_INCLUDES += \
  $(TOP)/vendor/nxp-private/libgpuperfcnt/include/ \
  $(TOP)/vendor/nxp-private/gputop/

LOCAL_CFLAGS += \
  -Wall -Wextra -Werror \
  -Wstrict-prototypes \
  -Wmissing-prototypes \
  -std=c99 \
  -O2 \
  -UNDEBUG \
  -DHAVE_DDR_PERF

LOCAL_STATIC_LIBRARIES += libgpuperfcnt

LOCAL_SRC_FILES := \
  gputop/debugfs.c \
  gputop/top.c

LOCAL_VENDOR_MODULE  := true
LOCAL_MODULE_TAGS    := optional
include $(BUILD_EXECUTABLE)
endif
