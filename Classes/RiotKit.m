//
//  RiotKit.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKOperation.h"
#import "RiotKit.h"

NSString * const RKRegionBrazil = @"br";
NSString * const RKRegionEUNorticAndEast = @"eune";
NSString * const RKRegionEUWest = @"euw";
NSString * const RKRegionKorea = @"kr";
NSString * const RKRegionLatinAmericaNorth = @"lan";
NSString * const RKRegionLatinAmericaSouth = @"las";
NSString * const RKRegionNorthAmerica = @"na";
NSString * const RKRegionOceania = @"oce";
NSString * const RKRegionRussia = @"ru";
NSString * const RKRegionTurkey = @"tr";

NSString * const RKChampionVersion = @"1.2";
NSString * const RKGameVersion = @"1.3";
NSString * const RKLeagueVersion = @"2.4";
NSString * const RKStaticDataVersion = @"1.2";
NSString * const RKStatsVersion = @"1.3";
NSString * const RKSummonerVersion = @"1.4";
NSString * const RKTeamVersion = @"2.3";

NSString * const RiotKitErrorDomain = @"RiotKitErrorDomain";

static NSString * const RKAPIHost = @"api.pvp.net";
static NSString * const RKAPIEndpoint = @"/api/lol";

static NSString * const RKChampionEndpoint = @"/champion";

@interface RiotKit ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation RiotKit

- (instancetype)initWithAPIKey:(NSString *)apiKey region:(NSString *)region
{
    self = [super init];
    if (self) {
        _APIKey = apiKey;
        _region = region;
        _operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 10;
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
    return [self sendGetRequestWithURLPart:RKChampionEndpoint version:RKChampionVersion block:[self _championResponseWithCompletion:completion]];
}

- (NSOperation *)getFreeToPlayChampionsWithBlock:(RKChampionsResultBlock)completion
{
    return [self sendGetRequestWithURLPart:RKChampionEndpoint version:RKChampionVersion parameters:@{@"freeToPlay": @YES} block:[self _championResponseWithCompletion:completion]];
}

- (NSOperation *)getChampionWithID:(NSInteger)championID block:(RKChampionResultBlock)completion
{
    NSString *part = [NSString stringWithFormat:@"%@/%ld", RKChampionEndpoint, (long)championID];
    return [self sendGetRequestWithURLPart:part version:RKChampionVersion parameters:nil block:^(NSDictionary *result, NSError *error) {
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

//- (NSOperation *)getRecentGamesWithSummonerID:(NSInteger)summonerID block:(RKRecentGamesResultBlock)completion
//{
//}

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
    return [self sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
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
    return [self sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
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
    return [self sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
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
    return [self sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
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
    return [self sendGetRequestWithURLPart:part version:RKSummonerVersion block:^(NSDictionary *result, NSError *error) {
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

#pragma mark - Request

- (NSOperation *)sendGetRequestWithURLPart:(NSString *)part version:(NSString *)version block:(RKOperationCompletionBlock)completion
{
    return [self sendGetRequestWithURLPart:part version:version parameters:nil block:completion];
}

- (NSOperation *)sendGetRequestWithURLPart:(NSString *)part version:(NSString *)version parameters:(NSDictionary *)parameters block:(RKOperationCompletionBlock)completion
{
    NSURL *url = [self _requestURLWithURLPart:part version:version parameters:parameters];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    RKOperation *operation = [[RKOperation alloc] initWithRequest:request completionBlock:completion];
    [self.operationQueue addOperation:operation];
    return operation;
}

- (NSURL *)_requestURLWithURLPart:(NSString *)part version:(NSString *)version parameters:(NSDictionary *)parameters
{
    NSString *regionHost = [NSString stringWithFormat:@"%@.%@", self.region, RKAPIHost];
    NSString *path = [NSString stringWithFormat:@"%@/%@/v%@%@", RKAPIEndpoint, self.region, version, part];
    
    NSMutableString *queryString = [NSMutableString stringWithFormat:@"?api_key=%@", self.APIKey];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        if ([value isKindOfClass:NSNumber.class]) {
            if ([value isEqual:@YES]) {
                value = @"true";
            } else if ([value isEqual:@NO]) {
                value = @"false";
            }
        }
        [queryString appendFormat:@"&%@=%@", key, value];
    }];

    path = [NSString stringWithFormat:@"%@%@", path, queryString];
    return [[NSURL alloc] initWithScheme:@"https" host:regionHost path:path];
}

@end
