//
//  RKMatchHistorySummary.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKMatchHistorySummary : NSObject

@property (nonatomic, assign) NSInteger assists;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) NSInteger deaths;
@property (nonatomic, assign) NSInteger gameID;
@property (nonatomic, strong) NSString *gameMode; // RKGameMode?
@property (nonatomic, assign) BOOL invalid;
@property (nonatomic, assign) NSInteger kills;
@property (nonatomic, assign) NSInteger mapID;
@property (nonatomic, assign) NSInteger opposingTeamKills;
@property (nonatomic, strong) NSString *opposingTeamName;
@property (nonatomic, assign) BOOL didWin;

@end
