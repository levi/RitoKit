//
//  RKAggregateStats.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

@interface RKAggregatedStats : NSObject

/// Dominion only
@property (nonatomic, assign) NSInteger averageAssists;

/// Dominion only
@property (nonatomic, assign) NSInteger averageChampionsKilled;

/// Dominion only
@property (nonatomic, assign) NSInteger averageCombatPlayerScore;

/// Dominion only
@property (nonatomic, assign) NSInteger averageNodeCapture;

/// Dominion only
@property (nonatomic, assign) NSInteger averageNodeCaptureAssist;

/// Dominion only
@property (nonatomic, assign) NSInteger averageNodeNeutralize;

/// Dominion only
@property (nonatomic, assign) NSInteger averageNodeNeutralizeAssist;

/// Dominion only
@property (nonatomic, assign) NSInteger averageNumDeaths;

/// Dominion only
@property (nonatomic, assign) NSInteger averageObjectivePlayerScore;

/// Dominion only
@property (nonatomic, assign) NSInteger averageTeamObjective;

/// Dominion only
@property (nonatomic, assign) NSInteger averageTotalPlayerScore;

@property (nonatomic, assign) NSInteger botGamesPlayed;

@property (nonatomic, assign) NSInteger killingSpree;

/// Dominion only
@property (nonatomic, assign) NSInteger maxAssists;

@property (nonatomic, assign) NSInteger maxChampionsKilled;

/// Dominion only
@property (nonatomic, assign) NSInteger maxCombatPlayerScore;

@property (nonatomic, assign) NSInteger maxLargestCriticalStrike;

@property (nonatomic, assign) NSInteger maxLargestKillingSpree;

/// Dominion only
@property (nonatomic, assign) NSInteger maxNodeCapture;

/// Dominion only
@property (nonatomic, assign) NSInteger maxNodeCaptureAssist;

/// Dominion only
@property (nonatomic, assign) NSInteger maxNodeNeutralize;

/// Dominion only
@property (nonatomic, assign) NSInteger maxNodeNeutralizeAssist;

/// Only returned for ranked statistics
@property (nonatomic, assign) NSInteger maxNumDeaths;

/// Dominion only
@property (nonatomic, assign) NSInteger maxObjectivePlayerScore;

/// Dominion only
@property (nonatomic, assign) NSInteger maxTeamObjective;

@property (nonatomic, assign) NSInteger maxTimePlayed;

@property (nonatomic, assign) NSInteger maxTimeSpentLiving;

/// Dominion only
@property (nonatomic, assign) NSInteger maxTotalPlayerScore;

@property (nonatomic, assign) NSInteger mostChampionKillsPerSession;

@property (nonatomic, assign) NSInteger mostSpellsCast;

@property (nonatomic, assign) NSInteger normalGamesPlayed;

@property (nonatomic, assign) NSInteger rankedPremadeGamesPlayed;

@property (nonatomic, assign) NSInteger rankedSoloGamesPlayed;

@property (nonatomic, assign) NSInteger totalAssists;

@property (nonatomic, assign) NSInteger totalChampionKills;

@property (nonatomic, assign) NSInteger totalDamageDealt;

@property (nonatomic, assign) NSInteger totalDamageTaken;

/// Only returned for ranked statistics
@property (nonatomic, assign) NSInteger totalDeathsPerSession;

@property (nonatomic, assign) NSInteger totalDoubleKills;

@property (nonatomic, assign) NSInteger totalFirstBlood;

@property (nonatomic, assign) NSInteger totalGoldEarned;

@property (nonatomic, assign) NSInteger totalHeal;

@property (nonatomic, assign) NSInteger totalMagicDamageDealt;

@property (nonatomic, assign) NSInteger totalMinionKills;

@property (nonatomic, assign) NSInteger totalNeutralMinionsKilled;

/// Dominion only
@property (nonatomic, assign) NSInteger totalNodeCapture;

/// Dominion only
@property (nonatomic, assign) NSInteger totalNodeNeutralize;

@property (nonatomic, assign) NSInteger totalPentaKills;

@property (nonatomic, assign) NSInteger totalPhysicalDamageDealt;

@property (nonatomic, assign) NSInteger totalQuadraKills;

@property (nonatomic, assign) NSInteger totalSessionsLost;

@property (nonatomic, assign) NSInteger totalSessionsPlayed;

@property (nonatomic, assign) NSInteger totalSessionsWon;

@property (nonatomic, assign) NSInteger totalTripleKills;

@property (nonatomic, assign) NSInteger totalTurretsKilled;

@property (nonatomic, assign) NSInteger totalUnrealKills;

@end
