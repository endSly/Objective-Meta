//
//  OMOpenStruct.m
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import "OMOpenStruct.h"

#import "NSObject+AssociatedObjects.h"

@implementation OMOpenStruct

- (id)initWithValuesForKeys:(NSDictionary *)dict
{
    self = [super init];

    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }

    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    [self setAssociatedObject:value forKey:key];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return [self associatedObjectForKey:key];
}

- (id)objectForKeyedSubscript:(NSString *)key
{
    return [self valueForKey:key];
}

- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key
{
    [self setValue:obj forKey:key];
}

@end
