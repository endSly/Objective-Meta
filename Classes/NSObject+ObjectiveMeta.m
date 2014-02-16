//
//  NSObject+ObjectiveMeta.m
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import "NSObject+ObjectiveMeta.h"

#import <objc/runtime.h>

@implementation NSObject (ObjectiveMeta)

+ (BOOL)defineMethod:(SEL)selector do:(id)block
{
    return class_addMethod(self, selector, imp_implementationWithBlock(block), "@@:@");
}

+ (BOOL)defineClassMethod:(SEL)selector do:(id)block
{
    return class_addMethod(object_getClass(self), selector, imp_implementationWithBlock(block), "@@:@");
}

- (NSArray *)methods
{
    unsigned int count;
    Method *methods = class_copyMethodList(object_getClass(self), &count);
    NSString *methodsNames[count];

    for (int i = 0; i < count; ++i) {
        methodsNames[i] = NSStringFromSelector(method_getName(methods[i]));
    }

    return [NSArray arrayWithObjects:methodsNames count:count];
}

+ (NSArray *)methods
{
    return [object_getClass(self) methods];
}


+ (Class)classForProperty:(NSString *)propertyName
{
    objc_property_t property = class_getProperty(self, [propertyName cStringUsingEncoding:NSUTF8StringEncoding]);
    if (!property)
        return nil;
    
    const char *attr = property_getAttributes(property);
    if (!attr)
        return nil;

    NSString *attributes = [NSString stringWithUTF8String:attr];

    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"T@\\\"[^\\\"]+\\\""
                                                                           options:0
                                                                             error:&error];
    NSRange range = [regex rangeOfFirstMatchInString:attributes options:0 range:NSMakeRange(0, attributes.length)];

    if (range.location == NSNotFound || range.length < 4)
        return nil;

    NSString *type = [attributes substringWithRange:NSMakeRange(range.location + 3, range.length - 4)];

    return NSClassFromString(type);
}

+ (char)typeForProperty:(NSString *)propertyName
{
    objc_property_t property = class_getProperty(self, [propertyName cStringUsingEncoding:NSUTF8StringEncoding]);
    const char *attr = property_getAttributes(property);
    if (!attr)
        return 0;

    NSString *attributes = [NSString stringWithUTF8String:attr];

    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"T."
                                                                           options:0
                                                                             error:&error];
    NSRange range = [regex rangeOfFirstMatchInString:attributes options:0 range:NSMakeRange(0, attributes.length)];

    if (range.location == NSNotFound || range.length < 2)
        return 0;

    return [attributes characterAtIndex:range.location + 1];
}

+ (BOOL)hasProperty:(NSString *)propertyName
{
    return (BOOL) class_getProperty(self, [propertyName cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
