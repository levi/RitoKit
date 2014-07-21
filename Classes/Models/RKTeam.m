//
//  RKTeam.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKTeam.h"
#import "RKMatchHistorySummary.h"
#import "RKTeamStatDetail.h"

@implementation RKTeam

+ (NSDictionary *)objectMapping
{
    return @{
        @"fullId": RKMappingKey(fullID),
        @"matchHistory": RKMappingKey(matchHistory),
        @"name": RKMappingKey(name),
        @"roster": RKMappingKey(roster),
        @"status": RKMappingKey(status),
        @"tag": RKMappingKey(tag),
        @"teamStatDetails": RKMappingKey(teamStatDetails),
        @"createDate": RKMappingKey(createDate),
        @"modifyDate": RKMappingKey(modifyDate),
        @"lastGameDate": RKMappingKey(lastGameDate),
        @"lastJoinDate": RKMappingKey(lastJoinDate),
        @"secondLastJoinDate": RKMappingKey(secondLastJoinDate),
        @"thirdLastJoinDate": RKMappingKey(thirdLastJoinDate),
        @"lastJoinedRankedTeamQueueDate": RKMappingKey(lastJoinedRankedTeamQueueDate),
    };
}

+ (NSDictionary *)arrayKeyMapping
{
    return @{
        @"matchHistory": RKMatchHistorySummary.class,
        @"teamStatDetails": RKTeamStatDetail.class,
    };
}

@end
