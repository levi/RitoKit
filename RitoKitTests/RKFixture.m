//
//  RKFixtures.m
//  RitoKit
//
//  Created by Levi McCallum on 10/23/14.
//  Copyright (c) 2014 Levi McCallum. All rights reserved.
//

#import "RKFixture.h"

@interface RKFixture ()

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *version;

@end

@implementation RKFixture

+ (id)JSONWithFixtureName:(NSString *)name version:(NSString *)version
{
    RKFixture *fixture = [[RKFixture alloc] initWithName:name version:version];
    return [fixture JSONOutput];
}

- (instancetype)initWithName:(NSString *)name version:(NSString *)version
{
    self = [super init];
    if (self) {
        self.identifier = name;
        self.version = version;
    }
    return self;
}

- (id)JSONOutput
{
    NSError *error;
    NSData *fixtureData = [NSData dataWithContentsOfURL:[self fixtureURL] options:0 error:&error];
    if (error) {
        NSLog(@"Error unserializing JSON Fixture: %@", error);
        return nil;
    }

    id json = [NSJSONSerialization JSONObjectWithData:fixtureData options:0 error:&error];
    if (error) {
        NSLog(@"Error unserializing JSON Fixture: %@", error);
        return nil;
    }

    return json;
}

- (NSURL *)fixtureURL
{
    return [[self currentBundle] URLForResource:[self fixtureName] withExtension:@"json"];
}

- (NSString *)fixtureName
{
    return [NSString stringWithFormat:@"v%@_%@", self.version, self.identifier];
}

- (NSBundle *)currentBundle
{
    return [NSBundle bundleForClass:self.class];
}

@end
