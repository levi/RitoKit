//
//  RKOperation.h
//  RitoKit
//
//  Created by Levi McCallum on 7/8/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import "RKConstants.h"

@interface RKOperation : NSOperation

- (instancetype)initWithRequest:(NSURLRequest *)request completionBlock:(RKOperationCompletionBlock)completion;

@end
