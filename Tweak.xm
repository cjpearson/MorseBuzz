#import "MorseUtilities.h"
NSString* name;

%group CallingController
%hook MPIncomingPhoneCallController
- (void)viewDidLoad{
    %orig;
    name = [self performSelector:@selector(callerName)];
}
%end
%end

%hook SBPluginManager
-(Class)loadPluginBundle:(NSBundle*)bundle
{
    Class ret = %orig;
    if ([[bundle bundleIdentifier] isEqualToString:@"com.apple.mobilephone.incomingcall"] && [bundle isLoaded])
    {
        %init(CallingController);
    }

    return ret;
}
%end;

%hook SBUserAgent
- (void)playRingtoneAtPath:(id)arg1 vibrationPattern:(id)arg2{
    NSDictionary *prefs=[[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.connorjpearson.morsebuzz.plist"];
    
    name = [name lowercaseString]; //morse utilities only takes lowercase chars
    
    NSArray* splitName = [name componentsSeparatedByString:@" "];
    NSString* firstName = [splitName firstObject];
    NSString* lastName = [splitName lastObject];
    NSMutableString* initials = [[NSMutableString alloc] init];
    
    for(NSString* s in splitName){
        [initials appendString:[s substringToIndex:1]];
    }
    
    int nameMode = [[prefs objectForKey:@"nameMode"] intValue];
    switch (nameMode) {
        case 1:
            name = firstName;
            break;
        case 2:
            name = lastName;
            break;
        case 3:
            name = initials;
            break;
        default:
            break;
    }
    char first;
    if(name.length>=1) first = [name characterAtIndex:0];
    else first = '0';

    //check if in lowercase range
    if(first>=97 && first<=122 && [[prefs objectForKey:@"enabled"] boolValue]){
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        NSMutableArray* arr = [NSMutableArray array ];

        for(int i=0; i< name.length; i++){
            [MorseUtilities addChar:[name characterAtIndex:i] to:arr];
        }

        [dict setObject:arr forKey:@"VibePattern"];
        [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
        arg2 = dict;
    }
    %orig;
}
%end

%ctor
{
    %init;
}

