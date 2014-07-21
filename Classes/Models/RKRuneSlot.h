//
//  RKRuneSlot.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

#import "RKObjectMapper.h"

@interface RKRuneSlot : NSObject <RKObjectMapping>

@property (nonatomic, assign) NSInteger runeID;
@property (nonatomic, assign) NSInteger runeSlotID;

@end
