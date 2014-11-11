//
//  RKGame.m
//  RitoKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKPlayer.h"
#import "RKGame.h"

@implementation RKGame

+ (NSDictionary *)objectMapping
{
    return @{
        @"championId": RKMappingKey(championID),
        @"fellowPlayers": RKMappingKey(fellowPlayers),
        @"createDate": RKMappingKey(createDate),
        @"gameMode": RKMappingKey(gameMode),
        @"gameType": RKMappingKey(gameType),
        @"invalid": RKMappingKey(isInvalid),
        @"ipEarned": RKMappingKey(IPEarned),
        @"level": RKMappingKey(level),
        @"spell1": RKMappingKey(firstSpellID),
        @"spell2": RKMappingKey(secondSpellID),
        @"stats": RKMappingKey(stats),
        @"gameId": RKMappingKey(gameID),
        @"mapId": RKMappingKey(mapID),
        @"subType": RKMappingKey(gameSubType),
    };
}

+ (NSDictionary *)arrayKeyMapping
{
    return @{
         @"fellowPlayers": RKPlayer.class,
    };
}

+ (NSDictionary *)enumKeyMapping
{
    return @{
        @"gameType": @"RKGameType",
        @"gameMode": @"RKGameMode",
        @"subType": @"RKGameSubType",
    };
}

+ (NSUInteger)enumValueForKey:(NSString *)key value:(id)value
{
    if ([key isEqualToString:RKMappingKey(gameType)]) {
        return [self _enumValueForGameTypeWithValue:value];
    } else if ([key isEqualToString:RKMappingKey(gameMode)]) {
        return [self _enumValueForGameModeWithValue:value];
    } else if ([key isEqualToString:RKMappingKey(gameSubType)]) {
        return [self _enumValueForSubTypeWithValue:value];
    } else {
        return 0;
    }
}

+ (NSUInteger)_enumValueForGameTypeWithValue:(NSString *)value {
    if ([value isEqualToString:@"ODIN"]) {
        return RKGameModeOdin;
    } else if ([value isEqualToString:@"ARAM"]) {
        return RKGameModeAram;
    } else if ([value isEqualToString:@"TUTORIAL"]) {
        return RKGameModeTutorial;
    } else if ([value isEqualToString:@"ONEFORALL"]) {
        return RKGameModeOneForAll;
    } else if ([value isEqualToString:@"ASCENSION"]) {
        return RKGameModeAscension;
    } else if ([value isEqualToString:@"FIRSTBLOOD"]) {
        return RKGameModeFirstBlood;
    } else if ([value isEqualToString:@"HEXAKILL"]) {
        return RKGameModeHexakill;
    } else {
        return RKGameModeClassic;
    }
}

+ (NSUInteger)_enumValueForGameModeWithValue:(NSString *)value {
    if ([value isEqualToString:@"MATCHED_GAME"]) {
        return RKGameTypeMatchedGame;
    } else if ([value isEqualToString:@"TUTORIAL_GAME"]) {
        return RKGameTypeTutorialGame;
    } else {
        return RKGameTypeCustomGame;
    }
}

+ (NSUInteger)_enumValueForSubTypeWithValue:(NSString *)value {
    if ([value isEqualToString:@"NORMAL"]) {
        return RKGameSubTypeNormal;
    } else if ([value isEqualToString:@"BOT"]) {
        return RKGameSubTypeBot;
    } else if ([value isEqualToString:@"RANKED_SOLO_5x5"]) {
        return RKGameSubTypeRankedSolo5x5;
    } else if ([value isEqualToString:@"RANKED_PREMADE_3x3"]) {
        return RKGameSubTypeRankedPremade3x3;
    } else if ([value isEqualToString:@"RANKED_PREMADE_5x5"]) {
        return RKGameSubTypeRankedPremade5x5;
    } else if ([value isEqualToString:@"ODIN_UNRANKED"]) {
        return RKGameSubTypeOdinUnranked;
    } else if ([value isEqualToString:@"RANKED_TEAM_3x3"]) {
        return RKGameSubTypeRankedTeam3x3;
    } else if ([value isEqualToString:@"RANKED_TEAM_5x5"]) {
        return RKGameSubTypeRankedTeam5x5;
    } else if ([value isEqualToString:@"NORMAL_3x3"]) {
        return RKGameSubTypeNormal3x3;
    } else if ([value isEqualToString:@"BOT_3x3"]) {
        return RKGameSubTypeBot3x3;
    } else if ([value isEqualToString:@"CAP_5x5"]) {
        return RKGameSubTypeCap5x5;
    } else if ([value isEqualToString:@"ARAM_UNRANKED_5x5"]) {
        return RKGameSubTypeAramUnranked5x5;
    } else if ([value isEqualToString:@"ONEFORALL_5x5"]) {
        return RKGameSubTypeOneForAll5x5;
    } else if ([value isEqualToString:@"FIRSTBLOOD_1x1"]) {
        return RKGameSubTypeFirstBlood1x1;
    } else if ([value isEqualToString:@"FIRSTBLOOD_2x2"]) {
        return RKGameSubTypeFirstBlood2x2;
    } else if ([value isEqualToString:@"SR_6x6"]) {
        return RKGameSubTypeSR6x6;
    } else if ([value isEqualToString:@"URF"]) {
        return RKGameSubTypeURF;
    } else if ([value isEqualToString:@"URF_BOT"]) {
        return RKGameSubTypeURFBot;
    } else if ([value isEqualToString:@"NIGHTMARE_BOT"]) {
        return RKGameSubTypeNightmareBot;
    } else if ([value isEqualToString:@"ASCENSION"]) {
        return RKGameSubTypeAscension;
    } else if ([value isEqualToString:@"HEXAKILL"]) {
        return RKGameSubTypeHexakill;
    } else {
        return RKGameSubTypeNone;
    }
}

@end
