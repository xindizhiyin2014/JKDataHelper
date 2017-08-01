//
//  JKDataHelperTests.m
//  JKDataHelperTests
//
//  Created by HHL110120 on 02/28/2017.
//  Copyright (c) 2017 HHL110120. All rights reserved.
//

@import XCTest;
#import <JKDataHelper/JKDataHelper.h>
@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    //NSString *str = @"111";
    }

- (void)testArray{

    NSString *str = nil;
    NSArray *arr = @[str];
    NSString *arr1 = @[str,@"111"];
    NSArray *arr2 = @[@"123",str];
    NSArray *arr3 = @[@"123",str,@"abc"];
    NSArray *arr4 = @[@"111",@"222",@"333"];
    

}


- (void)testDictionary{

   //NSString *str1 = @"aaa";
    NSString *str1 =nil;
    //NSString *str2 = @"111";
    NSString *str2 = nil;
    NSDictionary *dic = @{str1:str2};
    
}


- (void)testMutableArray{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"111",@"222",@"333", nil];
    [array removeObject:nil];
    [array replaceObjectAtIndex:1 withObject:@"aaa"];
    NSLog(@"array %@",array);
    [array removeObjectAtIndex:5];
}


@end

