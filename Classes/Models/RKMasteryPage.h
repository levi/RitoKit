//
//  RKMasteryPage.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKMasteryPage : NSObject

@property (nonatomic, assign) BOOL isCurrent;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSArray *masteries;
@property (nonatomic, strong) NSString *name;

@end
