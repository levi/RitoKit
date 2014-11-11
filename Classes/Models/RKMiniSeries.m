//
//  RKMiniSeries.m
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKMiniSeries.h"

@implementation RKMiniSeries

+ (NSDictionary *)objectMapping
{
    return @{
        @"losses": RKMappingKey(losses),
        @"progress": RKMappingKey(progress),
        @"target": RKMappingKey(target),
        @"wins": RKMappingKey(wins),
    };
}

+ (NSDictionary *)enumKeyMapping
{
    return @{ @"progress": @"RKMiniSeriesProgress" };
}

+ (NSUInteger)enumValueForKey:(NSString *)key value:(id)value
{
    if ([key isEqualToString:@"progress"]) {
        return [self _enumForProgressValue:value];
    } else {
        return 0;
    }
}

+ (NSUInteger)_enumForProgressValue:(NSString *)value {
    if ([value isEqualToString:@"W"]) {
        return RKMiniSeriesProgressWin;
    } else if ([value isEqualToString:@"L"]) {
        return RKMiniSeriesProgressLoss;
    } else {
        return RKMiniSeriesProgressNotPlayed;
    }
}

@end
