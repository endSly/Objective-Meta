//
//  NSObject+Delegate.h
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Delegate)

/**
 *
 */
+ (BOOL)delegate:(SEL)method to:(SEL)property prefix:(NSString *)prefix;

@end
