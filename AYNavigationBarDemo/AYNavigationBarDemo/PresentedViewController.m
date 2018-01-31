//
//  PresentedViewController.m
//  AYNavigationBarDemo
//
//  Created by GorXion on 2018/1/31.
//  Copyright © 2018年 adinnet. All rights reserved.
//

#import "PresentedViewController.h"
#import "AYNavigationBar.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    // 为没有导航栏的页面注册一个自定义导航栏，实际这个页面没有navigationController
    [self registerNavigationBar];
    self.ay_navigationItem.title = @"Presented";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 80, 44);
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    self.ay_navigationItem.leftBarButton = button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
