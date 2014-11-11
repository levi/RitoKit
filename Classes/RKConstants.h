//
//  RKConstants.h
//  RitoKit
//
//  Created by Levi McCallum on 10/24/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

extern NSString * const RKRegionBrazil;
extern NSString * const RKRegionEUNorticAndEast;
extern NSString * const RKRegionEUWest;
extern NSString * const RKRegionKorea;
extern NSString * const RKRegionLatinAmericaNorth;
extern NSString * const RKRegionLatinAmericaSouth;
extern NSString * const RKRegionNorthAmerica;
extern NSString * const RKRegionOceania;
extern NSString * const RKRegionRussia;
extern NSString * const RKRegionTurkey;

extern NSString * const RKChampionVersion;
extern NSString * const RKGameVersion;
extern NSString * const RKLeagueVersion;
extern NSString * const RKStaticDataVersion;
extern NSString * const RKStatsVersion;
extern NSString * const RKSummonerVersion;
extern NSString * const RKTeamVersion;

extern NSString * const RKAPIHost;
extern NSString * const RKAPIEndpoint;

extern NSString * const RitoKitErrorDomain;

typedef NS_ENUM(NSInteger, RKErrorCode) {
    RKErrorCodeBadRequest = 400,
    RKErrorCodeUnauthorized = 401,
    RKErrorCodeRateLimitExceeded = 429,
    RKErrorCodeServerError = 500,
    RKErrorCodeServiceUnavaiable = 503,
};

typedef void (^RKOperationCompletionBlock)(NSDictionary *result, NSError *error);
