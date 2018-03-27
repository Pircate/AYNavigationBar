//
//  UIViewController+NavigationBar.m
//  UIViewController+NavigationBar
//
//  Created by G-Xi0N on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import "UIViewController+NavigationBar.h"

#import <objc/runtime.h>

@implementation UIViewController (NavigationBar)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *sels = @[@"viewDidLoad", @"viewWillAppear:"];
        [sels enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(obj));
            NSString *swizzledSel = [@"ay__" stringByAppendingString:obj];
            Method swizzledMethod = class_getInstanceMethod(self, NSSelectorFromString(swizzledSel));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }];
    });
}

- (void)ay__viewDidLoad
{
    [self ay__viewDidLoad];
    [self bindNavigationBar];
}

- (void)ay__viewWillAppear:(BOOL)animated
{
    [self ay__viewWillAppear:animated];
    [self bringNavigationBarToFront];
}

- (void)bindNavigationBar
{
    if (!self.navigationController) {
        return;
    }
    self.navigationController.navigationBar.hidden = YES;
    self.ay_navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
    self.ay_navigationBar.shadowImage = self.navigationController.navigationBar.shadowImage;
    self.ay_navigationBar.titleTextAttributes = self.navigationController.navigationBar.titleTextAttributes;
    UIImage *backgroundImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    [self.ay_navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:self.ay_navigationBar];
}

- (void)bringNavigationBarToFront
{
    if (!self.navigationController) {
        return;
    }
    [self.view bringSubviewToFront:self.ay_navigationBar];
}

#pragma mark - getter & setter
- (AYNavigationBar *)ay_navigationBar
{
    AYNavigationBar *navigationBar = objc_getAssociatedObject(self, _cmd);
    if (!navigationBar) {
        navigationBar = [[AYNavigationBar alloc] initWithNavigationItem:self.ay_navigationItem];
        objc_setAssociatedObject(self, @selector(ay_navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navigationBar;
}

- (void)setAy_navigationBar:(AYNavigationBar *)ay_navigationBar
{
    objc_setAssociatedObject(self, @selector(ay_navigationBar), ay_navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UINavigationItem *)ay_navigationItem
{
    UINavigationItem *navigationItem = objc_getAssociatedObject(self, _cmd);
    if (!navigationItem) {
        navigationItem = [[UINavigationItem alloc] init];
        objc_setAssociatedObject(self, @selector(ay_navigationItem), navigationItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navigationItem;
}

- (void)setAy_navigationItem:(UINavigationItem *)ay_navigationItem
{
    objc_setAssociatedObject(self, @selector(ay_navigationItem), ay_navigationItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UINavigationController (NavigationBar)

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.topViewController.ay_navigationBar.frame = self.navigationBar.frame;
}

@end
