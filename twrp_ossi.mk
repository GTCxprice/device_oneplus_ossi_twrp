#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from ossi device
$(call inherit-product, device/oneplus/ossi/device.mk)

PRODUCT_DEVICE := ossi
PRODUCT_NAME := twrp_ossi
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := ossi
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_RELEASE_NAME := 10R
