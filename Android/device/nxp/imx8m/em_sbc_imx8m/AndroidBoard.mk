LOCAL_PATH := $(call my-dir)

include $(CONFIG_REPO_PATH)/common/build/kernel.mk
include $(CONFIG_REPO_PATH)/common/build/uboot.mk
include $(CONFIG_REPO_PATH)/common/build/dtbo.mk
include $(CONFIG_REPO_PATH)/common/build/imx-recovery.mk
include $(CONFIG_REPO_PATH)/common/build/gpt.mk
include $(LOCAL_PATH)/AndroidUboot.mk
include $(LOCAL_PATH)/AndroidTee.mk
include $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media-profile.mk
include $(FSL_PROPRIETARY_PATH)/fsl-proprietary/sensor/fsl-sensor.mk
