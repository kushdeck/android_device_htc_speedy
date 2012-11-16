#
# Copyright (C) 2009 The Android Open Source Project
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
#

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/speedy/configs/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/speedy/ramdisk/init.speedy.rc:root/init.speedy.rc \
    device/htc/speedy/ramdisk/ueventd.speedy.rc:root/ueventd.speedy.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/speedy/speedy-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/speedy/overlay

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# CameraHal
PRODUCT_PACKAGES += \
    camera.msm7x30

# Misc
PRODUCT_PACKAGES += \
    gps.speedy \
    sensors.speedy \
    lights.speedy

# WiMAX support
PRODUCT_PACKAGES += \
  CMWimaxSettings

# Temporary hack
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1

# Input config files
PRODUCT_COPY_FILES += \
    device/htc/speedy/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/speedy/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/speedy/usr/idc//speedy-keypad.idc:system/usr/idc/speedy-keypad.idc \
    device/htc/speedy/usr/keylayout/speedy-keypad.kl:system/usr/keylayout/speedy-keypad.kl

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/speedy/usr/keychars/speedy-keypad.kcm:system/usr/keychars/speedy-keypad.kcm \
    device/htc/speedy/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/speedy/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/speedy/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/speedy/firmware/BCM4329B1_002.002.023.0511.0538.hcd:system/etc/firmware/BCM4329B1_002.002.023.0511.0538.hcd \
    device/htc/speedy/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/speedy/firmware/default_mfg.acdb:system/etc/firmware/default_mfg.acdb \
    device/htc/speedy/firmware/default_org.acdb:system/etc/firmware/default_org.acdb

# OMX Config Profiles
PRODUCT_COPY_FILES += \
    device/htc/speedy/configs/vomeComp_RTSP.cfg:system/etc/vomeComp_RTSP.cfg \
    device/htc/speedy/configs/vomeComp.cfg:system/etc/vomeComp.cfg \
    device/htc/speedy/configs/vomeCore.cfg:system/etc/vomeCore.cfg \
    device/htc/speedy/configs/vomeplay.cfg:system/etc/vomeplay.cfg \
    device/htc/speedy/configs/vommcodec.cfg:system/etc/vommcodec.cfg \
    device/htc/speedy/configs/voPDLog.cfg:system/etc/voPDLog.cfg \
    device/htc/speedy/configs/voVidDec.dat:system/etc/voVidDec.dat

# speedy uses high-density artwork where available
PRODUCT_LOCALES += en

PRODUCT_COPY_FILES += \
    device/htc/speedy/configs/vold.fstab:system/etc/vold.fstab \
    device/htc/speedy/configs/apns-conf.xml:system/etc/apns-conf.xml

$(call inherit-product-if-exists, vendor/htc/speedy/speedy-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/speedy/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/speedy/media_htcaudio.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := htc_speedy
PRODUCT_DEVICE := speedy
