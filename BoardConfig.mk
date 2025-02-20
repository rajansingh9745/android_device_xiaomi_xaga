#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/xaga

# Inherit from mt6895-common
include device/xiaomi/mt6895-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
ODM_MANIFEST_SKUS += \
    xagain \
    xagainpro

ODM_MANIFEST_XAGAIN_FILES := $(DEVICE_PATH)/manifest_xagain.xml
ODM_MANIFEST_XAGAINPRO_FILES := $(DEVICE_PATH)/manifest_xagain.xml

# Kernel
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.vendor_boot))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD) $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Security Patch Level
BOOT_SECURITY_PATCH := 2024-11-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Inherit the proprietary files
include vendor/xiaomi/xaga/BoardConfigVendor.mk

#Flags
INFINITY_MAINTAINER := "Rajan Singh"
TARGET_SUPPORTS_BLUR := true
WITH_GAPPS := true
TARGET_BUILD_GOOGLE_TELEPHONY := true
USE_MOTO_CALCULATOR := true
ro.infinity.soc=Mediatek Dimensity 8100 max
ro.infinity.battery=5080 mAh
ro.infinity.display=1080 x 2460, 144 Hz
ro.infinity.camera=64MP + 8MP + 2MP
