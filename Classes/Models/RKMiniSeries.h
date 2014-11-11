//
//  RKMiniSeries.h
//  RitoKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import "RKObjectMapper.h"

typedef NS_ENUM(NSUInteger, RKMiniSeriesProgress) {
    RKMiniSeriesProgressWin,
    RKMiniSeriesProgressLoss,
    RKMiniSeriesProgressNotPlayed,
};

@interface RKMiniSeries : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, assign) RKMiniSeriesProgress progress;
@property (nonatomic, assign) NSInteger target;
@property (nonatomic, assign) NSInteger wins;

@end
