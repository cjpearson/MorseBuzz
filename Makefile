export THEOS_DEVICE_IP =  10.8.38.131
export ARCHS= armv7 arm64
export TARGET=iphone:latest:4.3
SDKVERSION = 7.0
include theos/makefiles/common.mk

TWEAK_NAME = MorseBuzz
MorseBuzz_FILES = Tweak.xm MorseUtilities.m

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += morsebuzzprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
