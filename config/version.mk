# Copyright (C) 2018 The DEVILIANOS Project
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

DEVILIAN_MOD_VERSION = v1.0

ifndef DEVILIAN_BUILD_TYPE
DEVILIAN_BUILD_TYPE := BETA

endif

ifeq ($(DEVILIAN_BUILD_TYPE), OFFICIAL)

PRODUCT_PACKAGES += \
    Updater

endif

TARGET_PRODUCT_SHORT := $(subst devilianos_,,$(DEVILIAN_BUILD))

# Gapps
ifeq ($(BUILD_WITH_GAPPS),true)
IS_PHONE := true
include vendor/gapps/config.mk

DEVILIAN_EDITION := GAPPS
DEVILIAN_BUILD_DATETIME := $(shell date +%s)
DEVILIAN_BUILD_DATE := $(shell date -d @$(DEVILIAN_BUILD_DATETIME) +"%Y%m%d-%H%M%S")
DEVILIAN_VERSION := DevilianOS-$(DEVILIAN_MOD_VERSION)-$(DEVILIAN_EDITION)-$(DEVILIAN_BUILD)-$(DEVILIAN_BUILD_TYPE)-$(DEVILIAN_BUILD_DATE)
DEVILIAN_FINGERPRINT := DevilianOS/$(DEVILIAN_MOD_VERSION)/$(DEVILIAN_EDITION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(DEVILIAN_BUILD_DATE)
DEVILIAN_DISPLAY_VERSION := DevilianOS-$(DEVILIAN_MOD_VERSION)-$(DEVILIAN_EDITION)-$(DEVILIAN_BUILD_TYPE)-$(DEVILIAN_BUILD_DATE)
else
DEVILIAN_EDITION := NORMAL
DEVILIAN_BUILD_DATETIME := $(shell date +%s)
DEVILIAN_BUILD_DATE := $(shell date -d @$(DEVILIAN_BUILD_DATETIME) +"%Y%m%d-%H%M%S")
DEVILIAN_VERSION := DevilianOS-$(DEVILIAN_MOD_VERSION)-$(DEVILIAN_BUILD)-$(DEVILIAN_BUILD_TYPE)-$(DEVILIAN_BUILD_DATE)
DEVILIAN_FINGERPRINT := DevilianOS/$(DEVILIAN_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(DEVILIAN_BUILD_DATE)
DEVILIAN_DISPLAY_VERSION := DevilianOS-$(DEVILIAN_MOD_VERSION)-$(DEVILIAN_BUILD_TYPE)-$(DEVILIAN_BUILD_DATE)

endif

PRODUCT_GENERIC_PROPERTIES += \
  ro.devilian.version=$(DEVILIAN_VERSION) \
  ro.devilian.releasetype=$(DEVILIAN_BUILD_TYPE) \
  ro.modversion=$(DEVILIAN_MOD_VERSION) \
  ro.devilian.build.date=$(DEVILIAN_BUILD_DATETIME)\
  ro.devilian.display.version=$(DEVILIAN_DISPLAY_VERSION) \
  ro.devilian.fingerprint=$(DEVILIAN_FINGERPRINT)\
  ro.devilian.edition=$(DEVILIAN_EDITION)
