//  MorseUtilities.m
//  passKey
//  Created by Connor Pearson on 5/16/14.

#import "MorseUtilities.h"
static int unitSize = 300;

@implementation MorseUtilities
+(void)addDashTo:(NSMutableArray*)arr{
	[arr addObject:[NSNumber numberWithBool:YES]];
	[arr addObject:[NSNumber numberWithInt:unitSize*3]];
	//then add pause
	[arr addObject:[NSNumber numberWithBool:NO]];
	[arr addObject:[NSNumber numberWithInt:unitSize]];
}
+(void)addDotTo:(NSMutableArray*)arr{
	[arr addObject:[NSNumber numberWithBool:YES]];
	[arr addObject:[NSNumber numberWithInt:unitSize]];
	//then add pause
	[arr addObject:[NSNumber numberWithBool:NO]];
	[arr addObject:[NSNumber numberWithInt:unitSize]];
}
+(void)addChar:(char)c to:(NSMutableArray*)arr{
    switch (c) {
        case 'a':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'b':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'c':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'd':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'e':
            [MorseUtilities addDotTo:arr];
            break;
        case 'f':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'g':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'h':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'i':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'j':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'k':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'l':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'm':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'n':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'o':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'p':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 'q':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'r':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 's':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        case 't':
            [MorseUtilities addDashTo:arr];
            break;
        case 'u':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'v':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'w':
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'x':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'y':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            break;
        case 'z':
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDashTo:arr];
            [MorseUtilities addDotTo:arr];
            [MorseUtilities addDotTo:arr];
            break;
        default:
            //assume space between words (7 units)
            [arr addObject:[NSNumber numberWithBool:NO]];
            [arr addObject:[NSNumber numberWithInt:unitSize*5]];
            break;
    }
    //add space of 3 unit (2 units + the one already added)
    [arr addObject:[NSNumber numberWithBool:NO]];
	[arr addObject:[NSNumber numberWithInt:unitSize*2]];
    
}

@end
