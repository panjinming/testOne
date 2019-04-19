//
//  ViewController.m
//  testRouter
//
//  Created by PanJinMing on 2017/11/22.
//  Copyright © 2017年 iwm. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    User *ss = [User buildWithblock:^(UserBuild *build) {
//        build.name = @"测试";
//    }];
//
//
//    NSLog(@"---%@",ss.name);
    
//    int objc_sync_enter(id obj)
    
    void(*fun)(id,SEL);
    fun =
    NSLog(@"----5");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"-----3");
    NSLog(@"-------4");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
