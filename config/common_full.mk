# Inherit common DevilianOS stuff
$(call inherit-product, vendor/devilian/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
