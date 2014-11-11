//
//  RKRequest.m
//  RitoKit
//
//  Created by Levi McCallum on 10/24/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKConstants.h"
#import "RKOperation.h"

#import "RKRequest.h"

@implementation RKRequest

- (instancetype)initWithAPIKey:(NSString *)apiKey region:(NSString *)region {
    self = [super init];
    if (self) {
        _APIKey = apiKey;
        _region = region;
        
        _operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 10;
    }
    return self;
}

#pragma mark - Request

- (NSOperation *)sendGetRequestWithURLPart:(NSString *)part version:(NSString *)version block:(RKOperationCompletionBlock)completion
{
    return [self sendGetRequestWithURLPart:part version:version parameters:nil block:completion];
}

- (NSOperation *)sendGetRequestWithURLPart:(NSString *)part version:(NSString *)version parameters:(NSDictionary *)parameters block:(RKOperationCompletionBlock)completion
{
    NSURL *url = [self requestURLWithURLPart:part version:version parameters:parameters];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    RKOperation *operation = [[RKOperation alloc] initWithRequest:request completionBlock:completion];
    [self.operationQueue addOperation:operation];
    return operation;
}

- (NSURL *)requestURLWithURLPart:(NSString *)part version:(NSString *)version parameters:(NSDictionary *)parameters
{
    NSString *regionHost = [NSString stringWithFormat:@"%@.%@", self.region, RKAPIHost];
    NSString *path = [NSString stringWithFormat:@"%@/%@/v%@%@", RKAPIEndpoint, self.region, version, part];
    
    NSMutableString *queryString = [NSMutableString stringWithFormat:@"?api_key=%@", self.APIKey];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        if ([value isKindOfClass:NSNumber.class]) {
            if ([value isEqual:@YES]) {
                value = @"true";
            } else if ([value isEqual:@NO]) {
                value = @"false";
            }
        }
        [queryString appendFormat:@"&%@=%@", key, value];
    }];
    
    path = [NSString stringWithFormat:@"%@%@", path, queryString];
    return [[NSURL alloc] initWithScheme:@"https" host:regionHost path:path];
}

@end
