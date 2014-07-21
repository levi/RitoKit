//
//  RKChampion.h
//  RiotKit
//
//  Created by Levi McCallum on 7/7/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import "RKObjectMapper.h"

@interface RKChampion : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, assign) BOOL isBotEnabled;
@property (nonatomic, assign) BOOL isBotMatchMadeEnabled;
@property (nonatomic, assign) BOOL isFreeToPlay;
@property (nonatomic, assign) BOOL isRankedPlayEnabled;

@end
