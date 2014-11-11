//
//  RKRoster.m
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKRoster.h"
#import "RKTeamMemberInfo.h"

@implementation RKRoster

+ (NSDictionary *)objectMapping
{
    return @{
        @"memberList": RKMappingKey(members),
        @"ownerId": RKMappingKey(ownerID),
    };
}

+ (NSDictionary *)arrayKeyMapping
{
    return @{
        @"memberList": RKTeamMemberInfo.class,
    };
}

@end
