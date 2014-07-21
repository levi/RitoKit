//
//  RKLeague.h
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

typedef NS_ENUM(NSInteger, RKLeagueQueue) {
    RKLeagueQueueRankedSolo5x5,
    RKLeagueQueueRankedTeam3x3,
    RKLeagueQueueRankedTeam5x5,
};

typedef NS_ENUM(NSInteger, RKLeagueTier) {
    RKLeagueChallenger,
    RKLeagueDiamond,
    RKLeaguePlatinum,
    RKLeagueGold,
    RKLeagueSilver,
    RKLeagueBronze,
};

@interface RKLeague : NSObject

@property (nonatomic, strong) NSArray *entries;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger *participantID;
@property (nonatomic, assign) RKLeagueQueue queue;
@property (nonatomic, assign) RKLeagueTier tier;

@end
