//
//  RKChampion.m
//  RitoKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKChampion.h"

@implementation RKChampion

+ (NSDictionary *)objectMapping
{
    return @{
        @"id": RKMappingKey(ID),
        @"botEnabled": RKMappingKey(isBotEnabled),
        @"botMmEnabled": RKMappingKey(isBotMatchMadeEnabled),
        @"freeToPlay": RKMappingKey(isFreeToPlay),
        @"active": RKMappingKey(isActive),
        @"rankedPlayEnabled": RKMappingKey(isRankedPlayEnabled)
    };
}

@end
