include vendor/devilian/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/devilian/config/BoardConfigQcom.mk
endif

include vendor/devilian/config/BoardConfigSoong.mk
