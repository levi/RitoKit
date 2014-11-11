//
//  RKSummoner.m
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKSummoner.h"

@implementation RKSummoner

+ (NSDictionary *)objectMapping
{
    return @{
        @"id": RKMappingKey(ID),
        @"name": RKMappingKey(name),
        @"profileIconId": RKMappingKey(profileIconID),
        @"revisionDate": RKMappingKey(revisionDate),
        @"summonerLevel": RKMappingKey(level),
    };
}

@end
