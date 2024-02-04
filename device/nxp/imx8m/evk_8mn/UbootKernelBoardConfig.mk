# from BoardConfig.mk
TARGET_BOOTLOADER_POSTFIX := bin
UBOOT_POST_PROCESS := true

# u-boot target for stand config and Trusty OS config
TARGET_BOOTLOADER_CONFIG := imx8mn-ddr4:imx8mn_ddr4_evk_android_defconfig
TARGET_BOOTLOADER_CONFIG += imx8mn:imx8mn_evk_android_defconfig
TARGET_BOOTLOADER_CONFIG += imx8mn-dual:imx8mn_evk_android_dual_defconfig
ifeq ($(PRODUCT_IMX_TRUSTY),true)
  TARGET_BOOTLOADER_CONFIG += imx8mn-trusty-dual:imx8mn_evk_android_trusty_dual_defconfig
  TARGET_BOOTLOADER_CONFIG += imx8mn-trusty-secure-unlock-dual:imx8mn_evk_android_trusty_secure_unlock_dual_defconfig
endif

# u-boot target used by uuu for imx8mn_evk
TARGET_BOOTLOADER_CONFIG += imx8mn-ddr4-evk-uuu:imx8mn_ddr4_evk_android_uuu_defconfig
TARGET_BOOTLOADER_CONFIG += imx8mn-evk-uuu:imx8mn_evk_android_uuu_defconfig

ifeq ($(IMX8MN_USES_GKI),true)
TARGET_KERNEL_DEFCONFIG := gki_defconfig
TARGET_KERNEL_GKI_DEFCONF := imx8mn_gki.fragment
else
TARGET_KERNEL_DEFCONFIG := imx_v8_android_defconfig
endif

TARGET_KERNEL_ADDITION_DEFCONF := android_addition_defconfig


# absolute path is used, not the same as relative path used in AOSP make
TARGET_DEVICE_DIR := $(patsubst %/, %, $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

# define bootloader rollback index
BOOTLOADER_RBINDEX ?= 0

