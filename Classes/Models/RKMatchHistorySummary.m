//
//  RKMatchHistorySummary.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKMatchHistorySummary.h"

@implementation RKMatchHistorySummary

+ (NSDictionary *)objectMapping
{
    return @{
        @"assists": RKMappingKey(assists),
        @"date": RKMappingKey(date),
        @"deaths": RKMappingKey(deaths),
        @"gameId": RKMappingKey(gameID),
        @"gameMode": RKMappingKey(gameMode),
        @"invalid": RKMappingKey(isInvalid),
        @"kills": RKMappingKey(kills),
        @"mapId": RKMappingKey(mapID),
        @"opposingTeamKills": RKMappingKey(opposingTeamKills),
        @"opposingTeamName": RKMappingKey(opposingTeamName),
        @"win": RKMappingKey(didWin),
    };
}

@end
