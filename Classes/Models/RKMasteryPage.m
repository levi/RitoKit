//
//  RKMasteryPage.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKMasteryPage.h"
#import "RKMastery.h"

@implementation RKMasteryPage

+ (NSDictionary *)objectMapping
{
    return @{
        @"id": RKMappingKey(ID),
        @"name": RKMappingKey(name),
        @"current": RKMappingKey(isCurrent),
        @"masteries": RKMappingKey(masteries),
    };
}

+ (NSDictionary *)arrayKeyMapping
{
    return @{
        @"masteries": RKMastery.class
    };
}

@end
