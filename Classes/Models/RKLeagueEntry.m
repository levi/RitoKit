//
//  RKLeagueEntry.m
//  RitoKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKLeagueEntry.h"
#import "RKMiniSeries.h"

@implementation RKLeagueEntry

+ (NSDictionary *)objectMapping
{
    return @{
        @"division": RKMappingKey(division),
        @"isFreshBlood": RKMappingKey(isFreshBlood),
        @"isHotStreak": RKMappingKey(isHotStreak),
        @"isInactive": RKMappingKey(isInactive),
        @"isVeteran": RKMappingKey(isVeteran),
        @"leaguePoints": RKMappingKey(leaguePoints),
        @"miniSeries": RKMappingKey(miniSeries),
        @"playerOrTeamId": RKMappingKey(playerOrTeamID),
        @"playerOrTeamName": RKMappingKey(playerOrTeamName),
        @"wins": RKMappingKey(wins),
    };
}

+ (NSDictionary *)arrayKeyMapping
{
    return @{ @"miniSeries": RKMiniSeries.class };
}

@end
