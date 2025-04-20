#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure core_64_bit.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit common LineageOS configurations
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configurations
$(call inherit-product, device/xiaomi/fuxi/device.mk)

# Inherit from Gapps
#$(call inherit-product, vendor/gms/config.mk)
#WITH_GMS := true

## Device identifier
PRODUCT_DEVICE := fuxi
PRODUCT_NAME := lineage_fuxi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 2211133G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_SYSTEM_NAME := 2211133G
PRODUCT_SYSTEM_DEVICE := 2211133G

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc=$(call normalize-path-list, "fuxi 15 AQ3A.240912.001 OS2.0.3.0.VMCCNXM user release-keys")

BUILD_FINGERPRINT := Xiaomi/fuxi/fuxi:15/AQ3A.240912.001/OS2.0.3.0.VMCCNXM:user/release-keys

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi


# Lunch banner maintainer variable
RISING_MAINTAINER="lamadaemon"

# Chipset/Maintainer properties (ro.rising.chipset/ro.rising.maintainer)
# Set RISING_MAINTAINER for version control
# (Optional if builder is setting properties via init_<device>.cpp)
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Snapdragon SM8550" \
    RisingMaintainer="lamadaemon"

RISING_MAINTAINER := lamadaemon

# Disable/enable blur support, false by default
TARGET_ENABLE_BLUR := true

# Whether to ship aperture camera, false by default
PRODUCT_NO_CAMERA := true

# Whether to ship lawnchair launcher, false by default
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true


# GMS build flags, false by default
# ship with GMS packages, replaces default AOSP packages with Google manufactured packages.
WITH_GMS := true

# These flags needs WITH_GMS set to true
# for more information about core GMS flags, please see vendor/gms/common/common-vendor.mk
# ships core GMS components that are needed to run GMS environment
TARGET_CORE_GMS := true

# extra add-ons for core GMS builds
# List of add-ons
PRODUCT_PACKAGES += \
    Photos \
    MarkupGoogle \
    LatinIMEGooglePrebuilt \
    AiWallpapers \
    WallpaperEmojiPrebuilt \
    PrebuiltDeskClockGoogle \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    Velvet
TARGET_CORE_GMS_EXTRAS := true

# on the other hand builders can build customize packages by simply defining product packages
# instead of defining TARGET_CORE_GMS_EXTRAS
# PRODUCT_PACKAGES += \
#    add package name here e.g: Velvet \
#    LatinIMEGooglePrebuilt (if builder prefers gboard)

# Whether to ship pixel launcher and set it as default launcher, false by default
TARGET_DEFAULT_PIXEL_LAUNCHER := false

# Whether to ship prebuilt Google Dialer and Messages, false by default
TARGET_INCLUDE_GOOGLE_DIALER := true

