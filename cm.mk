$(call inherit-product, device/htc/speedy/speedy.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := cm_speedy
PRODUCT_DEVICE := speedy
PRODUCT_MODEL := HTC Evo Shift
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_speedy BUILD_FINGERPRINT=sprint/htc_speedy/speedy:2.3.3/GRI40/74499:user/release-keys PRIVATE_BUILD_DESC="2.76.651.4 CL74499 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := speedy
-include vendor/cm/config/common_versions.mk
