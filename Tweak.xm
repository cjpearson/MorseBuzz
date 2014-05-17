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
    name = [name lowercaseString]; //morse utilities only takes lowercase chars

    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    NSMutableArray* arr = [NSMutableArray array ];

    for(int i=0; i< name.length; i++){
        [MorseUtilities addChar:[name characterAtIndex:i] to:arr];
    }

    [dict setObject:arr forKey:@"VibePattern"];
    [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
    arg2 = dict;
    %orig;  
}
%end

%ctor
{
    %init;
}

