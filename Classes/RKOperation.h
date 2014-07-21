//
//  RKOperation.h
//  RiotKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;

typedef void (^RKOperationCompletionBlock)(NSDictionary *result, NSError *error);

@interface RKOperation : NSOperation

- (instancetype)initWithRequest:(NSURLRequest *)request completionBlock:(RKOperationCompletionBlock)completion;

@end
