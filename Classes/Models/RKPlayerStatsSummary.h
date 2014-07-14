//
//  RKPlayerStatsSummary.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RKPlayerStatSummaryType) {
    RKPlayerStatSummaryTypeAramUnranked5x5,
    RKPlayerStatSummaryTypeCoopVsAI,
    RKPlayerStatSummaryTypeCoopVSAI3x3,
    RKPlayerStatSummaryTypeOdinRunranked,
    RKPlayerStatSummaryTypeRankedPremade3x3,
    RKPlayerStatSummaryTypeRankedPremade5x5,
    RKPlayerStatSummaryTypeRankedSolo5x5,
    RKPlayerStatSummaryTypeRankedTeam3x3,
    RKPlayerStatSummaryTypeUnranked,
    RKPlayerStatSummaryTypeUnranked3x3,
    RKPlayerStatSummaryTypeOneForAll5x5,
    RKPlayerStatSummaryTypeFirstBlood1x1,
    RKPlayerStatSummaryTypeFirstBlood2x2,
    RKPlayerStatSummaryTypeSummonersRift6x6,
    RKPlayerStatSummaryTypeCAP5x5,
    RKPlayerStatSummaryTypeURF,
    RKPlayerStatSummaryTypeURFBots,
};

@interface RKPlayerStatsSummary : NSObject

@property (nonatomic, strong) NSArray *aggregateStats;
@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, assign) RKPlayerStatSummaryType summaryType;
@property (nonatomic, assign) NSInteger wins;


@end
