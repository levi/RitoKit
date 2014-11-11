//
//  RKLeague.m
//  RitoKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKLeague.h"
#import "RKLeagueEntry.h"

@implementation RKLeague

+ (NSDictionary *)objectMapping
{
    return @{
        @"participantId": RKMappingKey(participantID),
        @"name": RKMappingKey(name),
        @"queue": RKMappingKey(queue),
        @"tier": RKMappingKey(tier),
        @"entries": RKMappingKey(entries),
    };
}

+ (NSDictionary *)arrayKeyMapping
{
    return @{ @"entries": RKLeagueEntry.class };
}

+ (NSDictionary *)enumKeyMapping
{
    return @{
        @"tier": @"RKLeagueTier",
        @"queue": @"RKLeagueQueue",
    };
}

+ (NSUInteger)enumValueForKey:(NSString *)key value:(id)value
{
    if ([key isEqualToString:@"tier"]) {
        return [self _enumValueForTierValue:value];
    } else if ([key isEqualToString:@"queue"]) {
        return [self _enumValueForQueueValue:value];
    } else {
        return 0;
    }
}

+ (NSUInteger)_enumValueForTierValue:(NSString *)value {
    if ([value isEqualToString:@"CHALLENGER"]) {
        return RKLeagueTierChallenger;
    } else if ([value isEqualToString:@"MASTER"]) {
        return RKLeagueTierMaster;
    } else if ([value isEqualToString:@"DIAMOND"]) {
        return RKLeagueTierDiamond;
    } else if ([value isEqualToString:@"PLATINUM"]) {
        return RKLeagueTierPlatinum;
    } else if ([value isEqualToString:@"GOLD"]) {
        return RKLeagueTierGold;
    } else if ([value isEqualToString:@"SILVER"]) {
        return RKLeagueTierSilver;
    } else {
        return RKLeagueTierBronze;
    }
}

+ (NSUInteger)_enumValueForQueueValue:(NSString *)value {
    if ([value isEqualToString:@"RANKED_SOLO_5x5"]) {
        return RKLeagueQueueRankedSolo5x5;
    } else if ([value isEqualToString:@"RANKED_TEAM_3x3"]) {
        return RKLeagueQueueRankedTeam3x3;
    } else {
        return RKLeagueQueueRankedTeam5x5;
    }
}

@end
