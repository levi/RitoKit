//
//  RKMasteryPage.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

#import "RKObjectMapper.h"

@interface RKMasteryPage : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isCurrent;
@property (nonatomic, strong) NSArray *masteries;

@end
