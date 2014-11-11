//
//  RKMastery.m
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKMastery.h"

@implementation RKMastery

+ (NSDictionary *)objectMapping
{
    return @{
        @"id": RKMappingKey(ID),
        @"rank": RKMappingKey(rank)
    };
}

@end
