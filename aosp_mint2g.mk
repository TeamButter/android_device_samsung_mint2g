# Inherit device configuration
$(call inherit-product, device/samsung/mint2g/product.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mint \
    TARGET_DEVICE=mint \
    BUILD_FINGERPRINT="samsung/mintxx/mint:4.1.2/JZO54K/S5282XXANF3:user/release-keys" \
    PRIVATE_BUILD_DESC="mintxx-user 4.1.2 JZO54K S5282XXANF3 release-keys"
    

# Release name
PRODUCT_RELEASE_NAME := mint2g

# Overrides
PRODUCT_NAME := aosp_mint2g
PRODUCT_DEVICE := mint2g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S5282
PRODUCT_MANUFACTURER := Samsung
