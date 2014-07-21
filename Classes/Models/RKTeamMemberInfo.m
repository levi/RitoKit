//
//  RKTeamMemberInfo.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKTeamMemberInfo.h"

@implementation RKTeamMemberInfo

+ (NSDictionary *)objectMapping
{
    return @{
        @"inviteDate": RKMappingKey(inviteDate),
        @"joinDate": RKMappingKey(joinDate),
        @"playerId": RKMappingKey(playerID),
        @"status": RKMappingKey(status),
    };
}

@end
