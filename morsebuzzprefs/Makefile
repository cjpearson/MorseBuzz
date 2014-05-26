include theos/makefiles/common.mk

BUNDLE_NAME = MorseBuzzPrefs
MorseBuzzPrefs_FILES = MorseBuzzPrefs.mm
MorseBuzzPrefs_INSTALL_PATH = /Library/PreferenceBundles
MorseBuzzPrefs_FRAMEWORKS = UIKit
MorseBuzzPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MorseBuzzPrefs.plist$(ECHO_END)
