//
//  RKRunePage.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKRunePage.h"
#import "RKRuneSlot.h"

@implementation RKRunePage

+ (NSDictionary *)objectMapping
{
    return @{
        @"id": RKMappingKey(ID),
        @"current": RKMappingKey(isCurrent),
        @"name": RKMappingKey(name),
        @"slots": RKMappingKey(slots),
    };
}

+ (NSDictionary *)arrayKeyMapping
{
    return @{ @"slots": RKRuneSlot.class };
}

@end
