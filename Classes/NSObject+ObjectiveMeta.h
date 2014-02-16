//
//  NSObject+ObjectiveMeta.h
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ObjectiveMeta)

/**
 *
 */
+ (BOOL)defineMethod:(SEL)selector do:(id)block;

/**
 *
 */
+ (BOOL)defineClassMethod:(SEL)selector do:(id)block;

/**
 *
 */
+ (NSArray *)methods;

/**
 *
 */
- (NSArray *)methods;

/**
 *
 */
+ (BOOL)hasProperty:(NSString *)propertyName;

/**
 *
 */
+ (Class)classForProperty:(NSString *)propertyName;

/**
 *
 */
+ (char)typeForProperty:(NSString *)propertyName;

@end
