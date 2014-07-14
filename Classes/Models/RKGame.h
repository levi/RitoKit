//
//  RKGame.h
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RKGameMode) {
    RKGameModeClassic,
    RKGameModeOdin,
    RKGameModeAram,
    RKGameModeTutorial,
    RKGameModeOneForAll,
    RKGameModeFirstBlood,
};

typedef NS_ENUM(NSInteger, RKGameType) {
    RKGameTypeCustomGame,
    RKGameTypeMatchedGame,
    RKGameTypeTutorialGame,
};

typedef NS_ENUM(NSInteger, RKGameSubType) {
    RKGameSubTypeNone,
    RKGameSubTypeNormal,
    RKGameSubTypeBot,
    RKGameSubTypeRankedSolo5x5,
    RKGameSubTypeRankedPremade3x3,
    RKGameSubTypeRankedPremade5x5,
    RKGameSubTypeOdinUnranked,
    RKGameSubTypeRankedTeam3x3,
    RKGameSubTypeRankedTeam5x5,
    RKGameSubTypeNormal3x3,
    RKGameSubTypeBot3x3,
    RKGameSubTypeCap5x5,
    RKGameSubTypeAramUnranked5x5,
    RKGameSubTypeOneForAll5x5,
    RKGameSubTypeFirstBlood1x1,
    RKGameSubTypeFirstBlood2x2,
    RKGameSubTypeSR6x6,
    RKGameSubTypeURF,
    RKGameSubTypeURFBot
};

@interface RKGame : NSObject

@property (nonatomic, assign) NSInteger championID;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSArray *fellowPlayers;
@property (nonatomic, assign) NSInteger gameID;
@property (nonatomic, assign) RKGameMode gameMode;
@property (nonatomic, assign) RKGameType gameType;
@property (nonatomic, assign) BOOL invalid;
@property (nonatomic, assign) NSInteger IPEarned;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger mapID;
@property (nonatomic, assign) NSInteger firstSpellID;
@property (nonatomic, assign) NSInteger secondSpellID;
@property (nonatomic, strong) id stats;
@property (nonatomic, assign) RKGameSubType subType;
@property (nonatomic, assign) NSInteger teamID;

@end
