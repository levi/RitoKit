//
//  RKRawStats.h
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKRawStats : NSObject

@property (nonatomic, assign) NSInteger assists;
@property (nonatomic, assign) NSInteger barracksKilled;
@property (nonatomic, assign) NSInteger championsKilled;
@property (nonatomic, assign) NSInteger combatPlayerScore;
@property (nonatomic, assign) NSInteger consumablesPurchased;
@property (nonatomic, assign) NSInteger damageDealtPlayer;
@property (nonatomic, assign) NSInteger doubleKills;
@property (nonatomic, assign) NSInteger firstBlood;
@property (nonatomic, assign) NSInteger gold;
@property (nonatomic, assign) NSInteger goldEarned;
@property (nonatomic, assign) NSInteger goldSpent;
@property (nonatomic, assign) NSInteger item0;
@property (nonatomic, assign) NSInteger item1;
@property (nonatomic, assign) NSInteger item2;
@property (nonatomic, assign) NSInteger item3;
@property (nonatomic, assign) NSInteger item4;
@property (nonatomic, assign) NSInteger item5;
@property (nonatomic, assign) NSInteger item6;
@property (nonatomic, assign) NSInteger itemsPurchased;
@property (nonatomic, assign) NSInteger killingSprees;
@property (nonatomic, assign) NSInteger largestCriticalStrike;
@property (nonatomic, assign) NSInteger largestKillingSpree;
@property (nonatomic, assign) NSInteger largestMultiKill;
@property (nonatomic, assign) NSInteger legendaryItemsCreated;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger magicDamageDealtPlayer;
@property (nonatomic, assign) NSInteger magicDamageDealtToChampions;
@property (nonatomic, assign) NSInteger magicDamageTaken;
@property (nonatomic, assign) NSInteger minionsDenied;
@property (nonatomic, assign) NSInteger minionsKilled;
@property (nonatomic, assign) NSInteger neutralMinionsKilled;
@property (nonatomic, assign) NSInteger neutralMinionsKilledEnemyJungle;
@property (nonatomic, assign) NSInteger neutralMinionsKilledYourJungle;
@property (nonatomic, assign) BOOL nexusKilled;
@property (nonatomic, assign) NSInteger nodeCapture;
@property (nonatomic, assign) NSInteger nodeCaptureAssist;
@property (nonatomic, assign) NSInteger nodeNeutralize;
@property (nonatomic, assign) NSInteger nodeNeutralizeAssist;
@property (nonatomic, assign) NSInteger numDeaths;
@property (nonatomic, assign) NSInteger numItemsBought;
@property (nonatomic, assign) NSInteger objectivePlayerScore;
@property (nonatomic, assign) NSInteger pentaKills;
@property (nonatomic, assign) NSInteger physicalDamageDealtPlayer;
@property (nonatomic, assign) NSInteger physicalDamageDealtToChampions;
@property (nonatomic, assign) NSInteger physicalDamageTaken;
@property (nonatomic, assign) NSInteger quadraKills;
@property (nonatomic, assign) NSInteger sightWardsBought;
@property (nonatomic, assign) NSInteger spell1Cast;
@property (nonatomic, assign) NSInteger spell2Cast;
@property (nonatomic, assign) NSInteger spell3Cast;
@property (nonatomic, assign) NSInteger spell4Cast;
@property (nonatomic, assign) NSInteger summonSpell1Cast;
@property (nonatomic, assign) NSInteger summonSpell2Cast;
@property (nonatomic, assign) NSInteger superMonsterKilled;
@property (nonatomic, assign) NSInteger team;
@property (nonatomic, assign) NSInteger teamObjective;
@property (nonatomic, assign) NSInteger timePlayed;
@property (nonatomic, assign) NSInteger totalDamageDealt;
@property (nonatomic, assign) NSInteger totalDamageDealtToChampions;
@property (nonatomic, assign) NSInteger totalDamageTaken;
@property (nonatomic, assign) NSInteger totalHeal;
@property (nonatomic, assign) NSInteger totalPlayerScore;
@property (nonatomic, assign) NSInteger totalScoreRank;
@property (nonatomic, assign) NSInteger totalTimeCrowdControlDealt;
@property (nonatomic, assign) NSInteger totalUnitsHealed;
@property (nonatomic, assign) NSInteger tripleKills;
@property (nonatomic, assign) NSInteger trueDamageDealtPlayer;
@property (nonatomic, assign) NSInteger trueDamageDealtToChampions;
@property (nonatomic, assign) NSInteger trueDamageTaken;
@property (nonatomic, assign) NSInteger turretsKilled;
@property (nonatomic, assign) NSInteger unrealKills;
@property (nonatomic, assign) NSInteger victoryPointTotal;
@property (nonatomic, assign) NSInteger visionWardsBought;
@property (nonatomic, assign) NSInteger wardKilled;
@property (nonatomic, assign) NSInteger wardPlaced;
@property (nonatomic, assign) BOOL didWin;

@end
