//
//  ViewController.m
//  testRouter
//
//  Created by PanJinMing on 2017/11/22.
//  Copyright © 2017年 iwm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"were");
    NSDate *curr  = [[NSDate alloc] init];
    NSTimeInterval currnettime = [curr timeIntervalSince1970];
    NSLog(@"%lf",currnettime);
    //1511924729.728362
    NSTimeInterval ss = 1511937340;    //14.36.3   14.44
    NSDate * currn = [NSDate dateWithTimeIntervalSinceNow:ss];
    NSDateFormatter *form = [[NSDateFormatter alloc]init];
    [form setDateFormat:@"YYYY MMM HH mm : ss"];
    NSString *str = [form stringFromDate:currn];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
