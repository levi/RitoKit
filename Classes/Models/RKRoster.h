//
//  RKRoster.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

#import "RKObjectMapper.h"

@interface RKRoster : NSObject <RKObjectMapping>

@property (nonatomic, strong) NSArray *members;
@property (nonatomic, assign) NSInteger ownerID;

@end
