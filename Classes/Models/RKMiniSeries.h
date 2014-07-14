//
//  RKMiniSeries.h
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RKMiniSeriesProgress) {
    RKMiniSeriesProgressWin,
    RKMiniSeriesProgressLoss,
    RKMiniSeriesProgressNotPlayed,
};

@interface RKMiniSeries : NSObject

@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, assign) RKMiniSeriesProgress progress;
@property (nonatomic, assign) NSInteger target;
@property (nonatomic, assign) NSInteger wins;

@end
