export THEOS_DEVICE_IP =  10.8.4.222
export ARCHS= armv7 arm64
export TARGET=iphone:latest:4.3
SDKVERSION = 7.0
include theos/makefiles/common.mk

TWEAK_NAME = MorseRing
MorseRing_FILES = Tweak.xm MorseUtilities.m

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
