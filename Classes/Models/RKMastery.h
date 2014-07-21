//
//  RKMastery.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

#import "RKObjectMapper.h"

@interface RKMastery : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger rank;

@end
