//
//  RKLeagueEntry.h
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import "RKObjectMapper.h"

@interface RKLeagueEntry : NSObject <RKObjectMapping>

@property (nonatomic, strong) NSString *division;
@property (nonatomic, assign) BOOL isFreshBlood;
@property (nonatomic, assign) BOOL isHotStreak;
@property (nonatomic, assign) BOOL isInactive;
@property (nonatomic, assign) BOOL isVeteran;
@property (nonatomic, assign) NSInteger leaguePoints;
@property (nonatomic, strong) NSArray *miniSeries;
@property (nonatomic, assign) NSInteger playerOrTeamID;
@property (nonatomic, strong) NSString *playerOrTeamName;
@property (nonatomic, assign) NSInteger wins;

@end
