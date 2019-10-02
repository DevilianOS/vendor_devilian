# Inherit full common DevilianOS stuff
$(call inherit-product, vendor/devilian/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Devilian LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/devilian/overlay/dictionaries

$(call inherit-product, vendor/devilian/config/telephony.mk)
