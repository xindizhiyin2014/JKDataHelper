//
//  JKViewController.m
//  JKDataHelper
//
//  Created by HHL110120 on 02/28/2017.
//  Copyright (c) 2017 HHL110120. All rights reserved.
//

#import "JKViewController.h"
#import "JKDataHelper.h"

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
//    NSArray *arr1 = @[@"123"];
//    NSLog(@"JKSafeArray(arr1) %@",JKSafeArray(arr1));
//    NSArray *arr1 = @"12313";
//    NSLog(@"JKSafeArray(arr1) %@",JKSafeArray(arr1));
    
//    NSString *str1 = @[@"123"];
//    NSLog(@"JKSafeStr(str1) %@",JKSafeStr(str1));
    
    //**************************************************
    NSArray * testArr = @[@"111",@"222",@"333"];
    
    NSLog(@"object :%@",[testArr objectAtIndex:4]);
    NSLog(@"object :%@",testArr[4]);
    
    //NSMutableArray * mutablArr = [NSMutableArray arrayWithObjects:@"111",@"222",@"333", nil];
    //NSLog(@"object :%@",mutablArr[5]);
    //[mutablArr objectAtIndex:5];
    //[mutablArr addObject:nil];
    //[mutablArr insertObject:nil atIndex:3];
    //[mutablArr removeObjectAtIndex:3];
    //[mutablArr replaceObjectAtIndex:1 withObject:nil];
    
    //NSString *str = nil;
    //NSDictionary *dic = [NSDictionary dictionaryWithObject:@"111" forKey:nil];
    //NSLog(@"dic:%@",dic);
    
  
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"111",@"aaa",@"222",@"bbb",@"333", nil];
    
//    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjects:nil forKeys:@[@"111"]];
//    NSString *str1 = nil;
//    NSDictionary *dic = @{str1:str1};
    
//    NSString *str =@"222";
//    NSArray *arr = @[@"111",str];
    
//    NSLog(@"class :%@",[arr class]);
//    NSArray * array = @[@"1",@"2"];
//    NSInteger index = [array jk_integerWithIndex:0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
