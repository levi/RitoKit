//
//  TeamStatDetail.h
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

#import "RKObjectMapper.h"

@interface RKTeamStatDetail : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger averageGamesPlayed;
@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, strong) NSString *teamStatType; // ENUM
@property (nonatomic, assign) NSInteger wins;

@end
