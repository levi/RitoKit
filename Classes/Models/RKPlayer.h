//
//  RKPlayer.h
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import "RKObjectMapper.h"

typedef NS_ENUM(NSUInteger, RKPlayerTeam) {
    RKPlayerTeamBlue = 100,
    RKPlayerTeamPurple = 200,
};

@interface RKPlayer : NSObject

@property (nonatomic, assign) NSInteger championID;
@property (nonatomic, assign) NSInteger summonerID;
@property (nonatomic, assign) RKPlayerTeam team;

@end
