//
//  RKTeam.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKRoster;

@interface RKTeam : NSObject

@property (nonatomic, strong) NSString *fullID;
@property (nonatomic, strong) NSArray *matchHistory;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) RKRoster *roster;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSArray *teamStatDetails;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSDate *lastGameDate;
@property (nonatomic, strong) NSDate *lastJoinDate;
@property (nonatomic, strong) NSDate *secondLastJoinDate;
@property (nonatomic, strong) NSDate *thirdLastJoinDate;
@property (nonatomic, strong) NSDate *lastJoinedRankedTeamQueueDate;

@end
