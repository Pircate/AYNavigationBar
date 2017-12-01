//
//  NextViewController.m
//  AYNavigationBarDemo
//
//  Created by 高翔 on 2017/12/1.
//  Copyright © 2017年 adinnet. All rights reserved.
//

#import "NextViewController.h"

#import "AYNavigationBar.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self registerNavigationBar];
    self.ay_navigationItem.title = @"下一页";
    
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
