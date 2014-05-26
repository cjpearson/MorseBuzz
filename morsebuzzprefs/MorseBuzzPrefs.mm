#import <Preferences/Preferences.h>

@interface MorseBuzzPrefsListController: PSListController {
}
@end

@implementation MorseBuzzPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"MorseBuzzPrefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
