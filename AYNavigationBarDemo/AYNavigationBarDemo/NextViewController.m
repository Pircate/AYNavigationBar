//
//  NextViewController.m
//  AYNavigationBarDemo
//
//  Created by gaoX on 2017/12/1.
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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.ay_navigationBar.backgroundColor = [UIColor blueColor];
    self.ay_navigationItem.title = @"下一页";
    self.ay_navigationItem.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
