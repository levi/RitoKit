//
//  RKRunePage.h
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

#import "RKObjectMapper.h"

@interface RKRunePage : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) BOOL isCurrent;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *slots;

@end
