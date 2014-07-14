//
//  RKOperation.m
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKOperation.h"
#import "RiotKit.h"

@interface RKOperation ()

@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, strong) RKOperationCompletionBlock completion;

@end

@implementation RKOperation

- (instancetype)initWithRequest:(NSURLRequest *)request completionBlock:(RKOperationCompletionBlock)completion
{
    self = [super init];
    if (self) {
        _request = request;
        _completion = completion;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithRequest:nil completionBlock:nil];
}

// TODO: Handle status code error
- (void)main
{
    NSURLResponse *response;
    NSError *error;
    
    if ([self isCancelled]) return;

    NSData *data = [NSURLConnection sendSynchronousRequest:self.request returningResponse:&response error:&error];
    
    if ([self isCancelled]) return;
    
    if (!data) {
        // TODO: handle error, data is nil, response is nil
        self.completion(nil, error);
        return;
    }

    id JSONResult = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    if ([self isCancelled]) return;
    
    if (!JSONResult) {
        self.completion(nil, error);
        return;
    }
    
    if ([JSONResult objectForKey:@"status"]) {
        NSInteger code = [(NSNumber *)[JSONResult valueForKeyPath:@"status.status_code"] integerValue];
        NSError *requestError = [NSError errorWithDomain:RiotKitErrorDomain code:code userInfo:nil];
        self.completion(nil, requestError);
        return;
    }

    self.completion(JSONResult, nil);
}

@end
