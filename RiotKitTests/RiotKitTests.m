//
//  RiotKitTests.m
//  RiotKitTests
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "XCTestCase+AsyncTesting.h"

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
    [self.riot getChampionsWithBlock:^(NSArray *champions, NSError *error) {
        XCTAssertNotNil(champions);
        XCTAssert(champions.count > 0, @"Should have a populated array of champions");
        XCTAssert([champions[0] isKindOfClass:RKChampion.class], @"Should return RKChampion objects");
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetFreeToPlayChampions
{
    [self.riot getFreeToPlayChampionsWithBlock:^(NSArray *champions, NSError *error) {
        XCTAssert(champions, @"Should return champions");
        XCTAssert(champions.count == 10, @"Should have 10 champions. Has %lu", (unsigned long)champions.count);
        for (RKChampion *champion in champions) {
            XCTAssertTrue(champion.isFreeToPlay, @"Champion should be free to play");
        }
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetChampionWithID
{
    [self.riot getChampionWithID:34 block:^(RKChampion *champion, NSError *error) {
        XCTAssert(champion, @"Should return champion");
        XCTAssert(champion.ID == 34, @"Should fetch the right champion");
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

#pragma mark - Test Games

- (void)testGetRecentGamesWithSummonerID
{
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
    [self.riot getSummonersWithNames:@[@"doublelift"] block:^(NSDictionary *objects, NSError *error) {
        XCTAssert(objects, @"Should return summoners");
        XCTAssert([objects[@"doublelift"] isKindOfClass:RKSummoner.class], @"should have summoner named key with a summoner object");
        RKSummoner *summoner = objects[@"doublelift"];
        XCTAssertEqual(summoner.ID, 20132258, @"should format the ID");
        XCTAssertEqualObjects(summoner.name, @"Doublelift", @"should format the name");
        XCTAssertEqual(summoner.profileIconID, 621, @"should format the profile icon ID");
        XCTAssert([summoner.revisionDate timeIntervalSinceNow] < [[NSDate date] timeIntervalSinceNow], @"should have a formatted timeinterval that was sometime in the past");
        XCTAssertEqual(summoner.level, 30, @"should format the level correctly");
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetSummonersWithSingleID
{
    [self.riot getSummonersWithIDs:@[@"20132258"] block:^(NSDictionary *objects, NSError *error) {
        XCTAssert(objects, @"Should return summoners");
        XCTAssert([objects[@"20132258"] isKindOfClass:RKSummoner.class], @"should have summoner id key with a summoner object");
        RKSummoner *summoner = objects[@"20132258"];
        XCTAssertEqual(summoner.ID, 20132258, @"should format the ID");
        XCTAssertEqualObjects(summoner.name, @"Doublelift", @"should format the name");
        XCTAssertEqual(summoner.profileIconID, 621, @"should format the profile icon ID");
        XCTAssert([summoner.revisionDate timeIntervalSinceNow] < [[NSDate date] timeIntervalSinceNow], @"should have a formatted timeinterval that was sometime in the past");
        XCTAssertEqual(summoner.level, 30, @"should format the level correctly");
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetSummonersWithMultipleIDs {}

- (void)testGetMasteryPagesWithSingleSummonerID
{
    [self.riot getMasteryPagesWithSummonerIDs:@[@"20132258"] block:^(NSDictionary *objects, NSError *error) {
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
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetMasteryPagesWithMultipleSummonerIDs
{
    [self.riot getMasteryPagesWithSummonerIDs:[self summonerIDs] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqual(objects.count, [self summoners].count, @"should have %lu objects", [self summoners].count);
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetSummonerNamesWithSingleSummonerID
{
    NSString *ID = [[self summonerIDs] firstObject];
    [self.riot getSummonerNamesWithSummonerIDs:@[ID] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqualObjects(objects[@"20132258"], @"Doublelift", "should include name of summoner");
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetSummonerNamesWithMultipleSummonerIDs
{
    [self.riot getSummonerNamesWithSummonerIDs:[self summonerIDs] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqual(objects.count, [self summoners].count, @"should have %lu objects", [self summoners].count);
        [objects enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            XCTAssertTrue([[self summonerNames] containsObject:obj], @"should contain summoner name: %@", obj);
        }];
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetRunePagesWithSingleSummonerID
{
    NSString *ID = [[self summonerIDs] firstObject];
    [self.riot getRunePagesWithSummonerIDs:@[ID] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        for (RKRunePage *page in objects[ID]) {
            [self validateRunePage:page];
        }
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
}

- (void)testGetRunePagesWithMultipleSummonerIDs
{
    [self.riot getRunePagesWithSummonerIDs:[self summonerIDs] block:^(NSDictionary *objects, NSError *error) {
        XCTAssertNil(error, @"error should be nil");
        XCTAssert(objects, @"object results should be populated");
        XCTAssertEqual(objects.count, [self summoners].count, @"should have %lu objects", [self summoners].count);
        [objects enumerateKeysAndObjectsUsingBlock:^(id key, NSArray *pages, BOOL *stop) {
            XCTAssert([[self summonerIDs] containsObject:key], @"should have the summoner's name as the key");
            for (RKRunePage *page in pages) {
                [self validateRunePage:page];
            }
        }];
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
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
    RiotKit *newRiot = [[RiotKit alloc] initWithAPIKey:[self fakeAPIKey] region:RKRegionNorthAmerica];
    [newRiot getChampionsWithBlock:^(NSArray *champions, NSError *error) {
        XCTAssertEqualObjects(error.domain, RiotKitErrorDomain);
        XCTAssertEqual(error.code, RKErrorCodeUnauthorized);
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    }];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:kRequestTimeout];
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
    NSURL *result = [self.riot _requestURLWithURLPart:@"/champion/123" version:@"1.2" parameters:@{
        @"freeToPlay": @YES,
        @"previousSkins": @NO,
        @"summonerName": @"LordKichigai",
    }];
    NSString *urlString = [NSString stringWithFormat:@"https://na.api.pvp.net/api/lol/na/v1.2/champion/123?api_key=%@&previousSkins=false&freeToPlay=true&summonerName=LordKichigai", self.riot.APIKey];
    NSURL *expected = [NSURL URLWithString:urlString];
    XCTAssertEqualObjects(result, expected, @"Should create valid request URL");
}

@end
