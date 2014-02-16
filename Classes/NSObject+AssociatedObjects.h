//
//  NSObject+AssociatedObjects.h
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObjects)

/**
 *
 */
- (void)setAssociatedObject:(id)object forKey:(NSString *)key;

/**
 *
 */
- (void)setWeakAssociatedObject:(id)object forKey:(NSString *)key;

/**
 *
 */
- (id)associatedObjectForKey:(NSString *)key;

/**
 *
 */
- (void)removeAssociatedObjectForKey:(NSString *)key;

/**
 *
 */
- (void)removeAssociatedObjects;

@end
