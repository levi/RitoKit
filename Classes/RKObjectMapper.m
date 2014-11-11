//
//  RKObjectMapper.m
//  RitoKit
//
//  Created by Levi McCallum on 7/9/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKObjectMapper.h"

@interface RKObjectMapper ()

@property (nonatomic, strong) Class<RKObjectMapping> classType;

@end

@implementation RKObjectMapper

+ (id)objectFromResponse:(NSDictionary *)response class:(Class)classType
{
    RKObjectMapper *mapper = [self mapperWithClass:classType];
    return [mapper objectForDictionary:response];
}

+ (NSArray *)arrayFromResponse:(NSArray *)response class:(Class)classType
{
    NSMutableArray *output = [NSMutableArray array];
    RKObjectMapper *mapper = [self mapperWithClass:classType];;
    for (NSInteger i = 0; i < [response count]; i++) {
        NSDictionary *object = response[i];
        [output addObject:[mapper objectForDictionary:object]];
    }
    return output;
}

+ (NSDictionary *)dictionaryFromResponse:(NSDictionary *)response class:(Class)classType
{
    NSMutableDictionary *output = [NSMutableDictionary dictionary];
    RKObjectMapper *mapper = [self mapperWithClass:classType];
    [response enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary *obj, BOOL *stop) {
        output[key] = [mapper objectForDictionary:obj];
    }];
    return output;
}

#pragma mark - Initialization

+ (instancetype)mapperWithClass:(Class<RKObjectMapping>)classType
{
    return [[self alloc] initWithClass:classType];
}

- (instancetype)initWithClass:(Class<RKObjectMapping>)classType
{
    self = [super init];
    if (self) {
        _classType = classType;
    }
    return self;
}

- (id)objectForDictionary:(NSDictionary *)dictionary
{
    NSDictionary *mapping = [self.classType objectMapping];
    id object = [(Class)self.classType new];

    for (NSString *key in dictionary) {
        id value = dictionary[key];
        NSString *mappingKey = mapping[key];
        
        if ([self transformValue:&value forKey:mappingKey]) {
            [object setValue:value forKey:mappingKey];
        }
    }

    return object;
}

#pragma mark - Value transforms

- (BOOL)transformValue:(id *)value forKey:(NSString *)key
{
    // Find key type
    NSString *typeAttribute = [self typeAttributeWithPropertyName:key];
    
    if (!typeAttribute) return NO;
    
    if ([self isEnumProperty:key]) {
        *value = @([self.classType enumValueForKey:key value:*value]);
        return *value != nil;
    }

    if ([self isClassTypeAttribute:typeAttribute]) {
        // ie. T@"NSString" --> NSString
        NSString *classAttribute = [typeAttribute substringWithRange:NSMakeRange(3, typeAttribute.length - 4)];

        NSLog(@"Class attribute: %@", classAttribute);
        
        Class classType = NSClassFromString(classAttribute);
        if (classType) {
            NSLog(@"%@ --> %@", key, NSStringFromClass(classType));
            return [self transformValue:value withClass:classType forKey:key];
        }
    } else {
        if ([*value isKindOfClass:NSNumber.class]) {
            // Transform integer into boolean
            if ([self isBOOLPropertyTypeForAttribute:typeAttribute]) {
                *value = @([*value boolValue]);
                return *value != nil;
            }
            
            // NSNumber to primatives is automatic
            return YES;
        }
    }
    
    return NO;
}

/** Transform an object value to a given class type.
 */
- (BOOL)transformValue:(id *)value withClass:(Class)classType forKey:(NSString *)key
{
    // Transform an array of objects into an array of transformed objects
    if ([*value isKindOfClass:NSArray.class]) {
        Class objectClassType = [self classTypeForArrayKey:key];
        
        // Ignore unidentified arrays
        if (!objectClassType) return NO;
        
        // Transform each object with in the array
        NSMutableArray *outputArray = [NSMutableArray array];
        RKObjectMapper *mapper = [[RKObjectMapper alloc] initWithClass:objectClassType];
        [*value enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            id outputObject = [mapper objectForDictionary:obj];
            NSLog(@"NSArray transform -- %@: %@", objectClassType, outputObject);
            [outputArray addObject:outputObject];
        }];
        *value = [outputArray copy];
        return YES;
    }
    
    // Don't transform objects that don't need to be transformed
    if ([*value isKindOfClass:classType]) return YES;
    
    if ([*value isKindOfClass:NSNumber.class]) {
        // Transform millisecond double into NSDate
        if ([classType isSubclassOfClass:NSDate.class]) {
            NSTimeInterval interval = [*value doubleValue] / 1000.0;
            *value = [NSDate dateWithTimeIntervalSince1970:interval];
            return *value != nil;
        }
    }

    return NO;
}

/** Fetch type attribute string of a given property on the scoped class type.
    
    Attribute is equivalent to @encode() result from Objective-C runtime.
 */
- (NSString *)typeAttributeWithPropertyName:(NSString *)key
{
    objc_property_t property = class_getProperty(self.classType, [key cStringUsingEncoding:NSASCIIStringEncoding]);
    
    if (!property) return nil;

    NSString *fullAttributes = @(property_getAttributes(property));
    NSArray *attributes = [fullAttributes componentsSeparatedByString:@","];
    
    return attributes[0];
}

/** Test if type attribute string is indeed a class type
 */
- (BOOL)isClassTypeAttribute:(NSString *)typeAttribute
{
    return [typeAttribute hasPrefix:@"T@"];
}

- (BOOL)isEnumProperty:(NSString *)key
{
    if ([self.classType enumKeyMapping]) {
        return [self.classType enumKeyMapping][key] != nil;
    }
    return NO;
}

/** Look up class type to transform array elements into
 */
- (Class)classTypeForArrayKey:(NSString *)key
{
    return [self.classType arrayKeyMapping][key];
}

#pragma mark - Property type manipulation

- (BOOL)isBOOLPropertyTypeForAttribute:(NSString *)typeAttribute
{
    NSString *propertyType = [typeAttribute substringFromIndex:1];
    const char *rawPropertyType = [propertyType UTF8String];
    return strcmp(rawPropertyType, @encode(BOOL)) == 0;
}

@end
