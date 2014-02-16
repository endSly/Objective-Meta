//
//  NSObject+AssociatedObjects.m
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import "NSObject+AssociatedObjects.h"

#import <objc/runtime.h>

@implementation NSObject (AssociatedObjects)

- (void)setAssociatedObject:(id)object forKey:(NSString *)key
{
    objc_setAssociatedObject(self, NSSelectorFromString(key), object, OBJC_ASSOCIATION_RETAIN);
}

- (void)setWeakAssociatedObject:(id)object forKey:(NSString *)key
{
    objc_setAssociatedObject(self, NSSelectorFromString(key), object, OBJC_ASSOCIATION_ASSIGN);
}

- (id)associatedObjectForKey:(NSString *)key
{
    return objc_getAssociatedObject(self, NSSelectorFromString(key));
}

- (void)removeAssociatedObjectForKey:(NSString *)key
{
    objc_setAssociatedObject(self, NSSelectorFromString(key), nil, OBJC_ASSOCIATION_ASSIGN);
}

- (void)removeAssociatedObjects
{
    objc_removeAssociatedObjects(self);
}

@end
