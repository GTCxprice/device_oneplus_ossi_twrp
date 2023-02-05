#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/ossi

# Build Hack
BUILD_BROKEN_DUP_RULES := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

BOARD_USES_RECOVERY_AS_BOOT := true

TARGET_USES_64_BIT_BINDER := true

TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a78

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k6895v1_64
TARGET_NO_BOOTLOADER := true

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_HEADER_SIZE := 2128
BOARD_KERNEL_TAGS_OFFSET := 0x07c88000
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_HEADER_SIZE := 2128
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true
TARGET_NO_KERNEL := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor
#BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 6645376892 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_PARTITION_LIST := system product vendor odm
BOARD_MAIN_SIZE := 9122611200 # TODO: Fix hardcoded value

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# Platform
TARGET_BOARD_PLATFORM := mt6895

# Recovery
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBx_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_KERNEL_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_KERNEL_BOOT := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Tools
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true
TW_INCLUDE_REPACKTOOLS := true

# Haptic
TW_SUPPORT_INPUT_AIDL_HAPTICS :=true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"

# USB Mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file

# Screen density
TARGET_SCREEN_DENSITY := 480

# Resolution
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Copy fstab to ensure the first stage boot mounts everything we need.
# See https://source.android.com/docs/core/architecture/kernel/mounting-partitions-early#fstab-ramdisk
PRODUCT_COPY_FILES += $(DEVICE_PATH)/fstab.$(TARGET_BOARD_PLATFORM):$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.$(TARGET_BOARD_PLATFORM)
PRODUCT_COPY_FILES += $(DEVICE_PATH)/fstab.$(TARGET_BOARD_PLATFORM):$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/fstab.$(TARGET_BOARD_PLATFORM)
PRODUCT_COPY_FILES += $(DEVICE_PATH)/fstab.$(TARGET_BOARD_PLATFORM):$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(TARGET_BOARD_PLATFORM)

# TWRP Configuration
TW_FRAMERATE := 120
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_BRIGHTNESS := 1000
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := hbtp_vm
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_LOAD_VENDOR_MODULES := "haptic.ko"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone54/temp
TW_EXCLUDE_APEX := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

# TW_EXCLUDE_ENCRYPTED_BACKUPS := false
TW_EXCLUDE_APEX := false
TW_NO_HAPTICS := false
TW_Y_OFFSET := 115
TW_H_OFFSET := -115
