//
//  RKFixtures.h
//  RitoKit
//
//  Created by Levi McCallum on 10/23/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKFixture : NSObject

+ (NSDictionary *)JSONWithFixtureName:(NSString *)name version:(NSString *)version;

@end
