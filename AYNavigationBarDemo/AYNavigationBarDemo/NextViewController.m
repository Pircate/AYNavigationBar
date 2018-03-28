//
//  NextViewController.m
//  AYNavigationBarDemo
//
//  Created by gaoX on 2017/12/1.
//  Copyright © 2017年 adinnet. All rights reserved.
//

#import "NextViewController.h"

#import "AYNavigation.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.ay_navigation.bar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.ay_navigation.bar.barTintColor = [UIColor blueColor];
    self.ay_navigation.item.title = @"下一页";
    self.ay_navigation.bar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
