//
//  RKObjectMapper.h
//  RitoKit
//
//  Created by Levi McCallum on 7/9/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

@import Foundation;
#import <objc/runtime.h>

#define RKMappingKey(sel) (NSStringFromSelector(@selector(sel)))

@protocol RKObjectMapping <NSObject>

@required

+ (NSDictionary *)objectMapping;

@optional

+ (NSDictionary *)arrayKeyMapping;
+ (NSDictionary *)enumKeyMapping;
+ (NSUInteger)enumValueForKey:(NSString *)key value:(id)value;

@end

@interface RKObjectMapper : NSObject

/** Transform an object into a mapped object of a given class type.
 */
+ (id)objectFromResponse:(id)response class:(Class<RKObjectMapping>)classType;

/** Transform elements in array into mapped objects of a given class type.
 */
+ (NSArray *)arrayFromResponse:(NSArray *)response class:(Class<RKObjectMapping>)classType;

/** Transform values of a dictionary of results into mapped objects of a given class type, retaining key values
 */
+ (NSDictionary *)dictionaryFromResponse:(NSDictionary *)response class:(Class<RKObjectMapping>)classType;

/** Convenience factory
 */
+ (instancetype)mapperWithClass:(Class<RKObjectMapping>)classType;

/** Create a mapper of a given class type. Designated initializer.
 */
- (instancetype)initWithClass:(Class<RKObjectMapping>)classType;

@end
