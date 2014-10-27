//
//  RiotKitTests.m
//  RiotKitTests
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import UIKit;
@import XCTest;

#import "RKFixture.h"
#import "RKTestRequest.h"
#import "RKConstants.h"
#import "RiotKit.h"

static NSString * const kTestAPIKey = @"8459d3c7-e4a3-47b7-8c02-1552265c4a96";
static NSTimeInterval kRequestTimeout = 5.0;

@interface RiotKitTests : XCTestCase

@property (nonatomic, strong) RiotKit *riot;

@end

@implementation RiotKitTests

#pragma mark - Helpers

- (NSString *)fakeAPIKey
{
    return [[NSUUID UUID] UUIDString];
}

- (NSDictionary *)summoners
{
    return @{
        @"20132258": @"Doublelift",
        @"19234710": @"Snoopeh",
        @"38384562": @"xPeke",
    };
}

- (NSArray *)summonerNames
{
    return [[self summoners] allValues];
}

- (NSArray *)summonerIDs
{
    return [[self summoners] allKeys];
}

- (NSString *)summonerID
{
    return [[self summonerIDs] firstObject];
}

- (NSString *)summonerName
{
    return [[self summonerNames] firstObject];
}

- (RiotKit *)riotMockWithFixtureName:(NSString *)name version:(NSString *)version
{
    id JSONResponse = [RKFixture JSONWithFixtureName:name version:version];
    RKTestRequest *request = [[RKTestRequest alloc] initWithJSONResponse:JSONResponse];
    return [[RiotKit alloc] initWithAPIKey:kTestAPIKey region:RKRegionNorthAmerica requestManager:request];
}

#pragma mark - Setup/Teardown

- (void)setUp {
    [super setUp];
    _riot = [[RiotKit alloc] initWithAPIKey:kTestAPIKey region:RKRegionNorthAmerica];
}

- (void)tearDown {
    _riot = nil;
    [super tearDown];
}

#pragma mark - Test Champions

- (void)testGetChampions
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Champions"];
    RiotKit *rito = [self riotMockWithFixtureName:@"champions" version:RKChampionVersion];
    [rito getChampionsWithBlock:^(NSArray *champions, NSError *error) {
        XCTAssertNotNil(champions);
        XCTAssert(champions.count > 0, @"Should have a populated array of champions");
        XCTAssert([champions[0] isKindOfClass:RKChampion.class], @"Should return RKChampion objects");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetFreeToPlayChampions
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Free To Play Champions"];
    RiotKit *rito = [self riotMockWithFixtureName:@"champions_free" version:RKChampionVersion];
    [rito getFreeToPlayChampionsWithBlock:^(NSArray *champions, NSError *error) {
        XCTAssert(champions, @"Should return champions");
        XCTAssert(champions.count == 10, @"Should have 10 champions. Has %lu", (unsigned long)champions.count);
        for (RKChampion *champion in champions) {
            XCTAssertTrue(champion.isFreeToPlay, @"Champion should be free to play");
        }
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetChampionWithID
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Champion With ID"];
    RiotKit *rito = [self riotMockWithFixtureName:@"champion_single" version:RKChampionVersion];
    [rito getChampionWithID:34 block:^(RKChampion *champion, NSError *error) {
        XCTAssert(champion, @"Should return champion");
        XCTAssert(champion.ID == 34, @"Should fetch the right champion");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

#pragma mark - Test Games

- (void)testGetRecentGamesWithSummonerID
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Recent Games With Summoner ID"];

    NSInteger summonerID = [[self summonerID] integerValue];
    RiotKit *rito = [self riotMockWithFixtureName:@"game_recent" version:RKGameVersion];
    [rito getRecentGamesWithSummonerID:summonerID block:^(NSArray *games, NSError *error) {
        XCTAssert(games.count > 0, @"should return an array of games");
        XCTAssertNil(error, @"should not have an error");

        for (RKGame *game in games) {
            XCTAssert(game.gameID > 0);
            XCTAssert(game.IPEarned > 0);
            XCTAssert(game.firstSpellID > 0);
            XCTAssert(game.secondSpellID > 0);
            XCTAssert(game.gameMode >= 0);
            XCTAssert(game.gameType >= 0);
            XCTAssert(game.gameSubType >= 0);
            XCTAssert(game.mapID > 0);
        }
        
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

#pragma mark - Test Leauges

- (void)testGetLeaguesWithSingleSummonerID
{
}

- (void)testGetLeaguesWithMultipleSummonerIDs
{
}

- (void)testGetLeagueEntriesWithSingleSummonerID
{
}

- (void)testGetLeagueEntriesWithMultipleSummonerIDs
{
}

- (void)testGetLeaguesWithSingleTeamID
{
}

- (void)testGetLeaguesWithMultipleTeamIDs
{
}

- (void)testGetLeaugeEntriesWithSingleTeamID
{
}

- (void)testGetLeagueEntriesWithMultipleTeamIDs
{
}

- (void)testGetChallengerLeagueWithType
{
}

#pragma mark - Test Stats

- (void)testGetRankedStatsWithSummonerID
{
}

- (void)testGetStatsSummaryWithSummonerID
{
}

#pragma mark - Test Summoners

- (void)testGetSummonersWithSingleName
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Summoners With Single Name"];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_name" version:RKSummonerVersion];
    [rito getSummonersWithNames:@[@"doublelift"] block:^(NSDictionary *objects, NSError *error) {
        XCTAssert(objects, @"Should return summoners");
        XCTAssert([objects[@"doublelift"] isKindOfClass:RKSummoner.class], @"should have summoner named key with a summoner object");
        RKSummoner *summoner = objects[@"doublelift"];
        XCTAssertEqual(summoner.ID, 20132258, @"should format the ID");
        XCTAssertEqualObjects(summoner.name, @"Doublelift", @"should format the name");
        XCTAssertEqual(summoner.profileIconID, 621, @"should format the profile icon ID");
        XCTAssert([summoner.revisionDate timeIntervalSinceNow] < [[NSDate date] timeIntervalSinceNow], @"should have a formatted timeinterval that was sometime in the past");
        XCTAssertEqual(summoner.level, 30, @"should format the level correctly");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetSummonersWithSingleID
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Summoners With Single ID"];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_id" version:RKSummonerVersion];
    [rito getSummonersWithIDs:@[@"20132258"] block:^(NSDictionary *objects, NSError *error) {
        XCTAssert(objects, @"Should return summoners");
        XCTAssert([objects[@"20132258"] isKindOfClass:RKSummoner.class], @"should have summoner id key with a summoner object");
        RKSummoner *summoner = objects[@"20132258"];
        XCTAssertEqual(summoner.ID, 20132258, @"should format the ID");
        XCTAssertEqualObjects(summoner.name, @"Doublelift", @"should format the name");
        XCTAssertEqual(summoner.profileIconID, 621, @"should format the profile icon ID");
        XCTAssert([summoner.revisionDate timeIntervalSinceNow] < [[NSDate date] timeIntervalSinceNow], @"should have a formatted timeinterval that was sometime in the past");
        XCTAssertEqual(summoner.level, 30, @"should format the level correctly");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetSummonersWithMultipleIDs {}

- (void)testGetMasteryPagesWithSingleSummonerID
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Mastery Pages With Single Summoner ID"];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_id_masteries" version:RKSummonerVersion];
    [rito getMasteryPagesWithSummonerIDs:@[@"20132258"] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        NSArray *pages = objects[@"20132258"];
        XCTAssert([pages isKindOfClass:NSArray.class], @"should have an array of mastery pages");
        RKMasteryPage *masteryPage = pages.firstObject;
        XCTAssertEqual(masteryPage.ID, 34610192, @"should have an ID");
        XCTAssertEqualObjects(masteryPage.name, @"Mastery Page 1", @"should have a name");
        XCTAssertEqual(masteryPage.isCurrent, YES, @"should have a current flag");
        XCTAssert([masteryPage.masteries isKindOfClass:NSArray.class], @"should have an array of masteries");
        for (RKMastery *mastery in masteryPage.masteries) {
            XCTAssert(mastery.ID, @"should have an ID");
            XCTAssert(mastery.rank, @"should have a rank");
        }
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetMasteryPagesWithMultipleSummonerIDs
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Mastery Pages With Multiple Summoner IDs"];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_ids_masteries" version:RKSummonerVersion];
    [rito getMasteryPagesWithSummonerIDs:[self summonerIDs] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqual(objects.count, [self summoners].count, @"should have %lu objects", (unsigned long)[self summoners].count);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetSummonerNamesWithSingleSummonerID
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Master Pages With Single SummonerID"];
    NSString *ID = [[self summonerIDs] firstObject];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_id_name" version:RKSummonerVersion];
    [rito getSummonerNamesWithSummonerIDs:@[ID] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqualObjects(objects[@"20132258"], @"Doublelift", "should include name of summoner");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetSummonerNamesWithMultipleSummonerIDs
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Summoner Names With Multiple Summoner IDs"];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_ids_name" version:RKSummonerVersion];
    [rito getSummonerNamesWithSummonerIDs:[self summonerIDs] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqual(objects.count, [self summoners].count, @"should have %lu objects", (unsigned long)[self summoners].count);
        [objects enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            XCTAssertTrue([[self summonerNames] containsObject:obj], @"should contain summoner name: %@", obj);
        }];
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetRunePagesWithSingleSummonerID
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Rune Pages with Single Summoner ID"];

    NSString *ID = [[self summonerIDs] firstObject];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_id_runes" version:RKSummonerVersion];
    [rito getRunePagesWithSummonerIDs:@[ID] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        for (RKRunePage *page in objects[ID]) {
            [self validateRunePage:page];
        }
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)testGetRunePagesWithMultipleSummonerIDs
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Rune Pages with Multiple Summoner IDs"];
    RiotKit *rito = [self riotMockWithFixtureName:@"summoner_ids_runes" version:RKSummonerVersion];
    [rito getRunePagesWithSummonerIDs:[self summonerIDs] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqual(objects.count, [self summoners].count, @"should have %lu objects", (unsigned long)(unsigned long)[self summoners].count);
        [objects enumerateKeysAndObjectsUsingBlock:^(id key, NSArray *pages, BOOL *stop) {
            XCTAssert([[self summonerIDs] containsObject:key], @"should have the summoner's name as the key");
            for (RKRunePage *page in pages) {
                [self validateRunePage:page];
            }
        }];
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

- (void)validateRunePage:(RKRunePage *)page
{
    XCTAssert(page.ID > 0, @"should have an ID");
    XCTAssert(page.name.length > 0, @"should have a name");
    for (RKRuneSlot *slot in page.slots) {
        XCTAssert(slot.runeID > 0, @"should have a rune ID");
        XCTAssert(slot.runeSlotID > 0, @"should have a rune slot ID");
    }
}

#pragma mark - Test Teams

- (void)testGetTeamsWithSingleSummonerID
{
}

- (void)testGetTeamsWithMultipleSummonerIDs
{
}

- (void)testGetTeamsWithSingleTeamID
{
}

- (void)testGetTeamsWithMutlipleTeamIDs
{
}



#pragma mark - Request NSErrors

- (void)testInvalidAPIKey
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Invalid Request"];
    RiotKit *newRiot = [[RiotKit alloc] initWithAPIKey:[self fakeAPIKey] region:RKRegionNorthAmerica];
    [newRiot getChampionsWithBlock:^(NSArray *champions, NSError *error) {
        XCTAssertEqualObjects(error.domain, RiotKitErrorDomain);
        XCTAssertEqual(error.code, RKErrorCodeUnauthorized);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRequestTimeout handler:nil];
}

// TODO: OCMock 400 error
- (void)testBadRequest
{
    
}

// TODO: OCMock 429 error
- (void)testRateLimitExceeded
{
    
}

// TODO: OCMock 500 error
- (void)testServerError
{
    
}

// TODO: OCMock 503 error
- (void)testServiceUnavailable
{
    
}

#pragma mark - URL Request Test

- (void)testRequestURL {
    RKRequest *request = [[RKRequest alloc] initWithAPIKey:kTestAPIKey region:RKRegionNorthAmerica];
    NSURL *result = [request requestURLWithURLPart:@"/champion/123" version:@"1.2" parameters:@{
        @"freeToPlay": @YES,
        @"previousSkins": @NO,
        @"summonerName": @"DoubleLift",
    }];
    NSString *urlString = [NSString stringWithFormat:@"https://na.api.pvp.net/api/lol/na/v1.2/champion/123?api_key=%@&previousSkins=false&freeToPlay=true&summonerName=DoubleLift", self.riot.APIKey];
    NSURL *expected = [NSURL URLWithString:urlString];
    XCTAssertEqualObjects(result, expected, @"Should create valid request URL");
}

@end
