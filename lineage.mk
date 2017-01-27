## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := mint2g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/mint2g/full_mint2g.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mint \
    TARGET_DEVICE=mint \
    BUILD_FINGERPRINT="samsung/mintxx/mint:4.1.2/JZO54K/S5282XXANF3:user/release-keys" \
    PRIVATE_BUILD_DESC="mintxx-user 4.1.2 JZO54K S5282XXANF3 release-keys"
    

PRODUCT_NAME := lineage_mint2g
PRODUCT_DEVICE := mint2g
