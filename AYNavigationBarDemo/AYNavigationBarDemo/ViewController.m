//
//  ViewController.m
//  AYNavigationBarDemo
//
//  Created by gaoX on 2017/12/1.
//  Copyright © 2017年 adinnet. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

#import "UIViewController+NavigationBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.ay_navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBtnAction)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (void)rightBtnAction
{
    NextViewController *vc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
