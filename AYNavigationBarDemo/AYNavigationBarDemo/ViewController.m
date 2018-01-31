//
//  ViewController.m
//  AYNavigationBarDemo
//
//  Created by gaoX on 2017/12/1.
//  Copyright © 2017年 adinnet. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

#import "AYNavigationBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];

    UISwitch *st = [[UISwitch alloc] init];
    st.center = self.view.center;
    st.onTintColor = [UIColor blueColor];
    [st addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:st];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 80, 44);
    button.center = CGPointMake(self.view.center.x, CGRectGetMinY(st.frame) - 80);
    [button setTitle:@"present" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    // 设置标题
    self.ay_navigationItem.title = @"首页";

    // 设置标题文本属性
    // self.ay_navigationItem.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor orangeColor]};
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 30)];
    titleView.layer.cornerRadius = 5;
    titleView.layer.masksToBounds = YES;
    titleView.backgroundColor = [UIColor yellowColor];
    // 设置标题视图
    // self.ay_navigationItem.titleView = titleView;

    // 设置标题视图的风格
    // self.ay_navigationItem.titleViewStyle = AYNavigationBarTitleViewStyleAutomatic;

    // 设置导航栏背景色
    // self.ay_navigationBar.backgroundColor = [UIColor cyanColor];

    // 设置导航栏底部阴影图片
    UIImage *image = [[UIImage imageNamed:@"shadow"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.ay_navigationBar.shadowImage = image;

    // 设置导航栏背景图片
    // self.ay_navigationBar.backgroundImage = [UIImage imageNamed:@"nav"];

    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setTitle:@"push" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];

    // 设置导航栏左右按钮
    self.ay_navigationItem.rightBarButton = rightBtn;

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    rightButton.frame = CGRectMake(0, 0, 44, 44);

    // 设置导航栏左右items
    // self.ay_navigationItem.rightBarItems = @[rightBtn, rightButton];

    // 支持大标题
    // self.ay_navigationBar.prefersLargeTitles = YES;
    // 设置大标题文本属性
    // self.ay_navigationBar.largeTitleTextAttributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:30]};
    
    // 设置导航栏垂直位移
    // self.ay_navigationBar.verticalOffset = -44.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBtnAction
{
    ViewController *vc = [[ViewController alloc] init];
    // 禁用AYNavigationBar使用UINavigationBar
    // vc.ay_navigationBarDisabled = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)switchAction:(UISwitch *)sender
{
    // 隐藏导航栏
    [self.ay_navigationBar setHidden:sender.on animated:YES];
}

- (void)buttonAction:(UIButton *)sender
{
    NextViewController *vc = [[NextViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
