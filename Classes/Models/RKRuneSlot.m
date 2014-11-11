//
//  RKRuneSlot.m
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKRuneSlot.h"

@implementation RKRuneSlot

+ (NSDictionary *)objectMapping
{
    return @{
        @"runeId": RKMappingKey(runeID),
        @"runeSlotId": RKMappingKey(runeSlotID),
    };
}

@end
