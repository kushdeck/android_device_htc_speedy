$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit AOSP device configuration for speedy.
$(call inherit-product, device/htc/speedy/full_speedy.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_speedy
PRODUCT_BRAND := sprint
PRODUCT_DEVICE := speedy
PRODUCT_MODEL := PG06100
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_speedy BUILD_FINGERPRINT=sprint/htc_speedy/speedy:2.3.3/GRI40/74499:user/release-keys PRIVATE_BUILD_DESC="2.76.651.4 CL74499 release-keys"

# USB
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage
