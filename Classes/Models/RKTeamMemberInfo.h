//
//  RKTeamMemberInfo.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKTeamMemberInfo : NSObject

@property (nonatomic, strong) NSDate *inviteDate;
@property (nonatomic, strong) NSDate *joinDate;
@property (nonatomic, assign) NSInteger playerID;
@property (nonatomic, strong) NSString *status; // TODO: ENUM

@end
