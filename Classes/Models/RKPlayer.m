//
//  RKPlayer.m
//  RitoKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKPlayer.h"

@implementation RKPlayer

+ (NSDictionary *)objectMapping
{
    return @{
        @"championId": RKMappingKey(championID),
        @"summonerId": RKMappingKey(summonerID),
        @"teamId": RKMappingKey(team),
    };
}

+ (NSDictionary *)enumKeyMapping
{
    return @{
        @"teamId": @"RKPlayerTeam",
    };
}

+ (NSUInteger)enumValueForKey:(NSString *)key value:(id)value
{
    if ([key isEqualToString:@"teamId"]) {
        return [(NSNumber *)value integerValue];
    } else {
        return 0;
    }
}

@end
