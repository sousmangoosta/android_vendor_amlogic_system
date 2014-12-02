# Copyright 2013 The Android Open Source Project

ifneq ($(BUILD_TINY_ANDROID),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := healthd_board_mbox_default.cpp
LOCAL_MODULE := libhealthd.mboxdefault
LOCAL_C_INCLUDES := system/core/healthd
LOCAL_CFLAGS := -Werror
include $(BUILD_STATIC_LIBRARY)

endif
