//
//  ViewController.m
//  AYNavigationBarDemo
//
//  Created by gaoX on 2017/12/1.
//  Copyright © 2017年 adinnet. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "PresentedViewController.h"

#import "AYNavigationBar.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
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
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 64, 44);
    [leftBtn setTitle:@"present" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置导航栏左边按钮
    self.ay_navigationItem.leftBarButton = leftBtn;

    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setTitle:@"push" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];

    // 设置导航栏右边按钮
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
    
    // 设置导航栏内容高度偏移量
    // self.ay_navigationBar.contentOffset = -14.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (void)leftBtnAction
{
    PresentedViewController *vc = [[PresentedViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)rightBtnAction
{
    NextViewController *vc = [[NextViewController alloc] init];
    // 禁用AYNavigationBar使用UINavigationBar
    // vc.ay_navigationBarDisabled = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            self.ay_navigationBar.hidden = !self.ay_navigationBar.hidden;
            break;
        case 1:
            [self.ay_navigationBar setHidden:!self.ay_navigationBar.hidden animated:YES];
            break;
        case 2:
        {
            self.ay_navigationBar.prefersLargeTitles = !self.ay_navigationBar.prefersLargeTitles;
        }
            break;
        case 3:
        {
            [UIView animateWithDuration:0.25 animations:^{
                self.ay_navigationBar.verticalOffset = self.ay_navigationBar.verticalOffset == -44.f ? 0 : -44.f;
                self.ay_navigationItem.alpha = self.ay_navigationBar.verticalOffset == -44.f ? 0 : 1;
            }];
        }
            break;
        case 4:
            self.ay_navigationBar.contentOffset = self.ay_navigationBar.contentOffset == -14.f ? 0 : -14.f;
            break;
            
        default:
            break;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 animations:^{
            self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.ay_navigationBar.frame), 0, 0, 0);
        }];
    });
}

#pragma mark - getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.ay_navigationBar.frame), 0, 0, 0);
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = @[@"隐藏或显示导航栏无动画", @"隐藏或显示导航栏有动画", @"设置导航栏大标题", @"设置导航栏垂直位置偏移量", @"设置导航栏内容高度偏移量"];
    }
    return _dataSource;
}

@end
