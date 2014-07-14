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

static NSString * const kTestAPIKey = @"c24eb98c-529a-4b06-a860-5b051d6dddd6";
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
        XCTAssert(champions.count == 10, @"Should have 10 champions. Has %d", champions.count);
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
        XCTAssert([objects[@"20132258"] isKindOfClass:RKSummoner.class], @"should have summoner named key with a summoner object");
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
