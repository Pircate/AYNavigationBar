//
//  ViewController.m
//  AYNavigationBarDemo
//
//  Created by gaoX on 2017/12/1.
//  Copyright © 2017年 adinnet. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

#import "AYNavigation.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.tipLabel];
    
    self.ay_navigation.item.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightBtnAction)];
    self.ay_navigation.bar.isUnrestoredWhenViewWillLayoutSubviews = YES;
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

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = -scrollView.contentOffset.y + CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame);
    if (offsetY <= CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame)) {
        CGRect frame = self.ay_navigation.bar.frame;
        BOOL flag = offsetY > -24;
        frame.origin.y = flag ? offsetY : -24;
        self.ay_navigation.bar.tintColor = flag ? [UIColor blueColor] : [UIColor clearColor];
        self.ay_navigation.item.title = flag ? @"首页" : nil;
        self.ay_navigation.bar.frame = frame;
    }
    else {
        CGRect frame = self.ay_navigation.bar.frame;
        frame.origin.y = CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame);
        self.ay_navigation.bar.frame = frame;
    }
}

#pragma mark - getter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000);
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _scrollView;
}

- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 20)];
        _tipLabel.center = self.view.center;
        _tipLabel.text = @"上下滑动试试";
    }
    return _tipLabel;
}

@end
