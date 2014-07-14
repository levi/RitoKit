//
//  RKObjectMapper.m
//  RiotKit
//
//  Created by Levi McCallum on 7/9/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKObjectMapper.h"


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
    id object = [self.classType new];

    for (NSString *key in dictionary) {
        id value = dictionary[key];
        NSString *mappingKey = mapping[key];
        
        if ([self transformValue:&value forKey:mappingKey]) {
            [object setValue:value forKey:mappingKey];
        }
    }

    return object;
}

- (BOOL)transformValue:(id *)value forKey:(NSString *)key
{
    // Find key type
    NSString *typeAttribute = [self typeAttributeWithPropertyName:key];
    
    if (!typeAttribute) return NO;
    
    NSString *propertyType = [typeAttribute substringFromIndex:1];
    const char *rawPropertyType = [propertyType UTF8String];

    if ([self isClassTypeAttribute:typeAttribute]) {
        // T@"NSString" --> NSString
        NSString *classAttribute = [typeAttribute substringWithRange:NSMakeRange(3, typeAttribute.length - 4)];

        NSLog(@"Class attribute: %@", classAttribute);
        
        Class classType = NSClassFromString(classAttribute);
        if (classType) {
            NSLog(@"%@ --> %@", key, NSStringFromClass(classType));
            return [self transformValue:value withClass:classType forKey:key];
        }
    } else {
        if ([*value isKindOfClass:NSNumber.class]) {
            if (strcmp(rawPropertyType, @encode(BOOL)) == 0) {
                *value = @([*value boolValue]);
                return *value != nil;
            }
            
            // NSNumber to primatives is automatic
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)transformValue:(id *)value withClass:(Class)classType forKey:(NSString *)key
{
    if ([*value isKindOfClass:classType]) {
        return YES;
    }
    
    if ([*value isKindOfClass:NSNumber.class]) {
        if ([classType isSubclassOfClass:NSDate.class]) {
            NSTimeInterval interval = [*value doubleValue] / 1000.0;
            *value = [NSDate dateWithTimeIntervalSince1970:interval];
            return *value != nil;
        }
    }

    return NO;
}

- (NSString *)typeAttributeWithPropertyName:(NSString *)key
{
    objc_property_t property = class_getProperty(self.classType, [key cStringUsingEncoding:NSASCIIStringEncoding]);
    
    if (!property) return nil;

    NSString *fullAttributes = @(property_getAttributes(property));
    NSArray *attributes = [fullAttributes componentsSeparatedByString:@","];
    
    return attributes[0];
}

- (BOOL)isClassTypeAttribute:(NSString *)typeAttribute
{
    return [typeAttribute hasPrefix:@"T@"];
}

@end
