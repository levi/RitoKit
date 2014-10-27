//
//  RKTestRequest.m
//  RiotKit
//
//  Created by Levi McCallum on 10/25/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKTestRequest.h"

@implementation RKTestRequest

- (instancetype)initWithJSONResponse:(id)response
{
    self = [super initWithAPIKey:nil region:nil];
    if (self) {
        _JSONResponse = response;
    }
    return self;
}

- (NSOperation *)sendGetRequestWithURLPart:(NSString *)part version:(NSString *)version parameters:(NSDictionary *)parameters block:(RKOperationCompletionBlock)completion
{
    completion(self.JSONResponse, nil);
    return [[NSOperation alloc] init];
}

@end
