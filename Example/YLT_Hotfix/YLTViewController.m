//
//  YLTViewController.m
//  YLT_Hotfix
//
//  Created by xphaijj0305@126.com on 07/11/2018.
//  Copyright (c) 2018 xphaijj0305@126.com. All rights reserved.
//

#import "YLTViewController.h"

@interface YLTViewController ()

@end

@implementation YLTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSInteger index = [self div:@[@{@"str":@"str"}]];
//    NSLog(@"----- %zd", index);
    
    NSInteger result = [self addA:0 withB:2];
    NSLog(@"result ----- %zd", result);
}

- (NSInteger)addA:(NSInteger)a withB:(NSInteger)b {
    
    return a+b;
}

- (NSInteger)div:(NSArray *)num {
    NSLog(@"%@", num);
    return 12;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
