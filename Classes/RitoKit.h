//
//  RitoKit.h
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

#import "RKConstants.h"
#import "RKModels.h"

@class RKRequest;

typedef void (^RKChampionsResultBlock)(NSArray *champions, NSError *error);
typedef void (^RKDictionaryResultBlock)(NSDictionary *objects, NSError *error);
typedef void (^RKChampionResultBlock)(RKChampion *champion, NSError *error);
typedef void (^RKGamesResultBlock)(NSArray *games, NSError *error);
typedef void (^RKRankedStatsResultBlock)(RKRankedStats *rankedStats, NSError *error);
typedef void (^RKPlayerStatsSummaryResultBlock)(RKPlayerStatsSummary *playerStatsSummary, NSError *error);
typedef void (^RKLeagueResultBlock)(RKLeague *league, NSError *error);

@interface RitoKit : NSObject

@property (nonatomic, strong) NSString *APIKey;
@property (nonatomic, strong) NSString *region;

/** Create a wrapper instance with a configured API Key and region
 */
- (instancetype)initWithAPIKey:(NSString *)apiKey region:(NSString *)region;

- (instancetype)initWithAPIKey:(NSString *)apiKey region:(NSString *)region requestManager:(RKRequest *)requestManager;

/** Retrive game availability status for all champions.
 */
- (NSOperation *)getChampionsWithBlock:(RKChampionsResultBlock)completion;

/** Retrive game availability status for free to play champions.
 */
- (NSOperation *)getFreeToPlayChampionsWithBlock:(RKChampionsResultBlock)completion;

/** Retrive game availability status for a single champion.
 */
- (NSOperation *)getChampionWithID:(NSInteger)championID block:(RKChampionResultBlock)completion;

/** Retrive a summoner's recent games with granular stats.
 */
- (NSOperation *)getRecentGamesWithSummonerID:(NSInteger)summonerID block:(RKGamesResultBlock)completion;

/** Retrive leagues summoners belong to, mapped by summoner ID.
 */
- (NSOperation *)getLeaguesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion;

///** Retrive league entries, mapped by summoner ID.
// */
//- (NSOperation *)getLeagueEntriesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion;
//
///** Retrive leagues teams belong to, mapped by team ID.
// */
//- (NSOperation *)getLeaguesWithTeamIDs:(NSArray *)teamIDs block:(RKDictionaryResultBlock)completion;
//
///** Retrive league entries, mapped by team ID.
// */
//- (NSOperation *)getLeagueEntriesWithTeamIDs:(NSArray *)teamIDs block:(RKDictionaryResultBlock)completion;
//
///** Retrive a challenger league of a certain game type, with associated league entires.
// */
//- (NSOperation *)getChallengerLeagueWithType:(RKLeagueQueue)type block:(RKLeagueResultBlock)completion;
//
///** Retrive a summoner's stats from ranked games by their summoner ID.
// */
//- (NSOperation *)getRankedStatsWithSummonerID:(NSInteger)summonerID block:(RKRankedStatsResultBlock)completion;
//
///** Retrive a summary of a summoner's stats of all games by their summoner ID.
// */
//- (NSOperation *)getStatsSummaryWithSummonerID:(NSInteger)summonerID block:(RKPlayerStatsSummaryResultBlock)completion;

/** Retrive profile information for a given set of summoner names.
 */
- (NSOperation *)getSummonersWithNames:(NSArray *)summonerNames block:(RKDictionaryResultBlock)completion;

/** Retrive profile information for a given set of summoner IDs.
 */
- (NSOperation *)getSummonersWithIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion;

/** Retrive mastery pages of a list of summoners, mapped by their summoner ID.
 */
- (NSOperation *)getMasteryPagesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion;

/** Retrive summoner names, mapped by their summoner ID, from a given list of summoner IDs.
 */
- (NSOperation *)getSummonerNamesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion;

/** Retrive rune pages of a list of summoners, mapped by their summoner ID.
 */
- (NSOperation *)getRunePagesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion;

///**
// */
//- (NSOperation *)getTeamsWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion;

///**
// */
//- (NSOperation *)getTeamsWithTeamIDs:(NSArray *)teamIDs block:(RKDictionaryResultBlock)completion;

@end
