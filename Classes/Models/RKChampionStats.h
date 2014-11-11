//
//  RKChampionStats.h
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

@class RKAggregatedStats;

@interface RKChampionStats : NSObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) RKAggregatedStats *stats;

@end
