//
//  RKRankedStats.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKRankedStats : NSObject

@property (nonatomic, strong) NSArray *champions;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, assign) NSInteger summonerID;

@end
