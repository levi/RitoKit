//
//  RKTestRequest.h
//  RiotKit
//
//  Created by Levi McCallum on 10/25/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKRequest.h"

@interface RKTestRequest : RKRequest

@property (strong, nonatomic) id JSONResponse;

- (instancetype)initWithJSONResponse:(id)response;

@end
