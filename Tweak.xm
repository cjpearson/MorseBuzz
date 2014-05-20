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
    NSLog(@"%@", [prefs objectForKey:@"nameMode"] );
    NSLog(@"%@", [prefs objectForKey:@"enable"] );

    NSLog(@"%@", [prefs description]);
    NSLog(@"%@", [[prefs objectForKey:@"enabled"] boolValue] ? @"Yes" : @"No");
    NSLog(@"%@", [[prefs objectForKey:@"enabled"] intValue] == 1 ? @"Yes" : @"No");
    NSLog(@"%@", [[prefs objectForKey:@"enabled"] description]);




    name = [name lowercaseString]; //morse utilities only takes lowercase chars


    char first;
    if(name.length>=1) first = [name characterAtIndex:0];
    else first = '0';
    //check if in lowercase range
    if(first>=97 && first<=122){
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        NSMutableArray* arr = [NSMutableArray array ];

        for(int i=0; i< name.length; i++){
            [MorseUtilities addChar:[name characterAtIndex:i] to:arr];
        }

        [dict setObject:arr forKey:@"VibePattern"];
        [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
        if ([[prefs objectForKey:@"enabled"] boolValue]) arg2 = dict;
    }
    %orig;
}
%end

%ctor
{
    %init;
}

