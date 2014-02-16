//
//  NSObject+Delegate.m
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import "NSObject+Delegate.h"

#import "NSObject+ObjectiveMeta.h"

#define CAPITALIZED_STRING(str) ([NSString stringWithFormat:@"%@%@",[[str substringToIndex:1] uppercaseString],[str substringFromIndex:1]])

@implementation NSObject (Delegate)

+ (BOOL)delegate:(SEL)method to:(SEL)property prefix:(NSString *)prefix
{
    SEL delegatedMethod;

    NSString *delegatedName;
    if (prefix) {
        delegatedName = [NSString stringWithFormat:@"%@%@",
                                 prefix,
                                 CAPITALIZED_STRING(NSStringFromSelector(method))];

        delegatedMethod = NSSelectorFromString(delegatedName);

    } else {
        delegatedMethod = method;
    }

    return [self defineMethod:delegatedMethod do:^(id _self) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        id obj = [_self performSelector:property];

        return [obj performSelector:method];
#pragma clang diagnostic pop
    }];
}

@end
