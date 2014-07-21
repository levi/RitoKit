//
//  RKSummoner.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import "RKObjectMapper.h"

@interface RKSummoner : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger profileIconID;
@property (nonatomic, strong) NSDate *revisionDate;
@property (nonatomic, assign) NSInteger level;

@end
