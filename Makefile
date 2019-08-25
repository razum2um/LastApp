TWEAK_NAME = LastApp
APP_ID = jp.ashikase.lastapp

LastApp_FILES = Tweak.xm
LastApp_CFLAGS = -I$(THEOS_PROJECT_DIR)/Libraries/Common -F$(SYSROOT)/System/Library/CoreServices -DAPP_ID=\"$(APP_ID)\"
LastApp_LDFLAGS = -lactivator
LastApp_FRAMEWORKS = UIKit CoreGraphics

TARGET := iphone:12.0:7.0
ARCHS := arm64 arm64e

# NOTE: The following is needed until logos is updated to not generate
#       unnecessary 'ungrouped' objects.
# GO_EASY_ON_ME := 1

include theos/makefiles/common.mk
include theos/makefiles/tweak.mk

theos/bin/ldid:
	(cd ldid; make) && cp ldid/ldid2 theos/bin/ldid

distclean: clean
	- rm -f $(THEOS_PROJECT_DIR)/$(APP_ID)*.deb
	- rm -f $(THEOS_PROJECT_DIR)/.theos/packages/*
