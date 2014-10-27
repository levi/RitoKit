//
//  RKRequest.h
//  RiotKit
//
//  Created by Levi McCallum on 10/24/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import "RKConstants.h"

@interface RKRequest : NSObject

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSString *APIKey;
@property (nonatomic, strong) NSString *region;

- (instancetype)initWithAPIKey:(NSString *)apiKey region:(NSString *)region;

- (NSOperation *)sendGetRequestWithURLPart:(NSString *)part version:(NSString *)version parameters:(NSDictionary *)parameters block:(RKOperationCompletionBlock)completion;

- (NSOperation *)sendGetRequestWithURLPart:(NSString *)part version:(NSString *)version block:(RKOperationCompletionBlock)completion;

/**
 Builds a URL for API Requests
 */
- (NSURL *)requestURLWithURLPart:(NSString *)part version:(NSString *)version parameters:(NSDictionary *)parameters;

@end
