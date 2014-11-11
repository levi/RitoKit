//
//  TeamStatDetail.m
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKTeamStatDetail.h"

@implementation RKTeamStatDetail

+ (NSDictionary *)objectMapping
{
    return @{
        @"averageGamesPlayed": RKMappingKey(averageGamesPlayed),
        @"losses": RKMappingKey(losses),
        @"teamStatType": RKMappingKey(teamStatType),
        @"wins": RKMappingKey(wins),
    };
}

@end
