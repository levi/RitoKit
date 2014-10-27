//
//  RiotKit.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKConstants.h"
#import "RKRequest.h"
#import "RKOperation.h"

#import "RiotKit.h"

static NSString * const RKChampionEndpoint = @"/champion";

@interface RiotKit ()

@property (nonatomic, strong) RKRequest *request;

@end

@implementation RiotKit

- (instancetype)initWithAPIKey:(NSString *)apiKey region:(NSString *)region
{
    self = [super init];
    if (self) {
        _APIKey = apiKey;
        _region = region;
        self.request = [[RKRequest alloc] initWithAPIKey:apiKey region:region];
    }
    return self;
}

- (instancetype)initWithAPIKey:(NSString *)apiKey region:(NSString *)region requestManager:(RKRequest *)requestManager
{
    self = [self initWithAPIKey:apiKey region:region];
    if (self) {
        self.request = requestManager;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithAPIKey:nil region:nil];
}

#pragma mark - Champions

- (NSOperation *)getChampionsWithBlock:(RKChampionsResultBlock)completion
{
    return [self.request sendGetRequestWithURLPart:RKChampionEndpoint version:RKChampionVersion block:[self _championResponseWithCompletion:completion]];
}

- (NSOperation *)getFreeToPlayChampionsWithBlock:(RKChampionsResultBlock)completion
{
    return [self.request sendGetRequestWithURLPart:RKChampionEndpoint version:RKChampionVersion parameters:@{@"freeToPlay": @YES} block:[self _championResponseWithCompletion:completion]];
}

- (NSOperation *)getChampionWithID:(NSInteger)championID block:(RKChampionResultBlock)completion
{
    NSString *part = [NSString stringWithFormat:@"%@/%ld", RKChampionEndpoint, (long)championID];
    return [self.request sendGetRequestWithURLPart:part version:RKChampionVersion parameters:nil block:^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            RKChampion *champion = [RKObjectMapper objectFromResponse:result class:RKChampion.class];
            completion(champion, nil);
        }
    }];
}

- (RKOperationCompletionBlock)_championResponseWithCompletion:(RKChampionsResultBlock)completion
{
    return ^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSArray *response = [NSArray arrayWithArray:result[@"champions"]];
            NSArray *champions = [RKObjectMapper arrayFromResponse:response class:[RKChampion class]];
            completion(champions, nil);
        }
    };
}

#pragma mark - Games

- (NSOperation *)getRecentGamesWithSummonerID:(NSInteger)summonerID block:(RKGamesResultBlock)completion
{
    NSString *part = [NSString stringWithFormat:@"game/by-summoner/%ld/recent", (long)summonerID];
    return [self.request sendGetRequestWithURLPart:part version:RKGameVersion block:^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSArray *games = [RKObjectMapper arrayFromResponse:result[@"games"] class:[RKGame class]];
            completion(games, nil);
        }
    }];
}

#pragma mark - Leagues

//- (NSOperation *)getLeaguesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion
//{
//}

//- (NSOperation *)getLeagueEntriesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion
//{
//}

//- (NSOperation *)getLeaguesWithTeamIDs:(NSArray *)teamIDs block:(RKDictionaryResultBlock)completion
//{
//}

//- (NSOperation *)getLeagueEntriesWithTeamIDs:(NSArray *)teamIDs block:(RKDictionaryResultBlock)completion
//{
//}

//- (NSOperation *)getChallengerLeagueWithType:(RKLeagueQueue)type block:(RKLeagueResultBlock)completion
//{
//}

#pragma mark - Stats

//- (NSOperation *)getRankedStatsWithSummonerID:(NSInteger)summonerID block:(RKRankedStatsResultBlock)completion
//{
//}

//- (NSOperation *)getStatsSummaryWithSummonerID:(NSInteger)summonerID block:(RKPlayerStatsSummaryResultBlock)completion
//{
//}

#pragma mark - Summoners

- (NSOperation *)getSummonersWithNames:(NSArray *)summonerNames block:(RKDictionaryResultBlock)completion
{
    NSString *summoners = [summonerNames componentsJoinedByString:@","];
    NSString *part = [NSString stringWithFormat:@"/summoner/by-name/%@", summoners];
    return [self.request sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSDictionary *objects = [RKObjectMapper dictionaryFromResponse:result class:RKSummoner.class];
            completion(objects, nil);
        }
    }];
}

- (NSOperation *)getSummonersWithIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion
{
    NSString *summoners = [summonerIDs componentsJoinedByString:@","];
    NSString *part = [NSString stringWithFormat:@"/summoner/%@", summoners];
    return [self.request sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSDictionary *objects = [RKObjectMapper dictionaryFromResponse:result class:RKSummoner.class];
            completion(objects, nil);
        }
    }];
}

- (NSOperation *)getMasteryPagesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion
{
    NSString *summoners = [summonerIDs componentsJoinedByString:@","];
    NSString *part = [NSString stringWithFormat:@"/summoner/%@/masteries", summoners];
    return [self.request sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableDictionary *pages = [NSMutableDictionary dictionary];
            [result enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary *obj, BOOL *stop) {
                pages[key] = [RKObjectMapper arrayFromResponse:obj[@"pages"] class:RKMasteryPage.class];
            }];
            completion(pages, nil);
        }
    }];
}

- (NSOperation *)getSummonerNamesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion
{
    NSString *summoners = [summonerIDs componentsJoinedByString:@","];
    NSString *part = [NSString stringWithFormat:@"/summoner/%@/name", summoners];
    return [self.request sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            completion(result, nil);
        }
    }];
}

- (NSOperation *)getRunePagesWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion
{
    NSString *summoners = [summonerIDs componentsJoinedByString:@","];
    NSString *part = [NSString stringWithFormat:@"/summoner/%@/runes", summoners];
    return [self.request sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableDictionary *pages = [NSMutableDictionary dictionary];
            [result enumerateKeysAndObjectsUsingBlock:^(id ID, NSDictionary *obj, BOOL *stop) {
                pages[ID] = [RKObjectMapper arrayFromResponse:obj[@"pages"] class:RKRunePage.class];
            }];
            completion(pages, nil);
        }
    }];
}

#pragma mark - Teams

//- (NSOperation *)getTeamsWithSummonerIDs:(NSArray *)summonerIDs block:(RKDictionaryResultBlock)completion
//{
//}

//- (NSOperation *)getTeamsWithTeamIDs:(NSArray *)teamIDs block:(RKDictionaryResultBlock)completion
//{
//}

@end
