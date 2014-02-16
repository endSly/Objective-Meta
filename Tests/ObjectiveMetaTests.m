//
//  ObjectiveMetaTests.m
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ObjectiveMeta.h"

@interface ObjectiveMetaTests : XCTestCase

@end

@interface NSArray (Test)

- (NSString *)lastUppercaseString;

@end

@implementation ObjectiveMetaTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testAssociatedObject
{
    id obj = [[NSObject alloc] init];

    [obj setAssociatedObject:@"Test" forKey:@"testKey"];
    [obj setAssociatedObject:@(42) forKey:@"anotherTestKey"];

    XCTAssertEqualObjects(@"Test", [obj associatedObjectForKey:@"testKey"], @"Associated object should be stored");
    XCTAssertEqualObjects(@(42), [obj associatedObjectForKey:@"anotherTestKey"], @"Associated object should be stored");

    obj = [[NSObject alloc] init];

    XCTAssertNil([obj associatedObjectForKey:@"testKey"], @"Associated object should only be associates once");
}

- (void)testDelegateMethods
{
    [NSArray delegate:$(uppercaseString) to:$(lastObject) prefix:@"last"];

    NSArray *delegateTestArray = @[@1, @"test"];

    XCTAssertEqualObjects([delegateTestArray lastUppercaseString], @"TEST", @"Delegated methods should delegate method with prefix");

}

- (void)testOpenStruct
{
    OMOpenStruct *openStruct = [[OMOpenStruct alloc] initWithValuesForKeys:@{@"testKey": @"Test",
                                                                             @"anotherTestKey": @(42),
                                                                             @"testArray": @[@1, @2, @3]}];

    XCTAssertEqualObjects(openStruct[@"testKey"], @"Test", @"OpenStruct");
}

@end
