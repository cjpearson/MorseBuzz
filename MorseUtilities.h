//  MorseUtilities.h
//  Created by Connor Pearson on 5/16/14.

#import <Foundation/Foundation.h>

@interface MorseUtilities : NSObject
+(void)addDashTo:(NSMutableArray*)arr;
+(void)addDotTo:(NSMutableArray*)arr;
+(void)addChar:(char)c to:(NSMutableArray*)arr;
@end
