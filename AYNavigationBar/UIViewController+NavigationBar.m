//
//  UIViewController+NavigationBar.m
//  UIViewController+NavigationBar
//
//  Created by G-Xi0N on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "AYNavigationBar.h"
#import "AYNavigation.h"
#import "AYNavigationConfiguration.h"

#import <objc/runtime.h>

@interface UIViewController (NavigationBarPrivate)

@property (nonatomic, strong) AYNavigationBar *ay_navigationBar;

@property (nonatomic, strong) UINavigationItem *ay_navigationItem;

@end

@implementation UIViewController (NavigationBarPrivate)

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
    if (!self.navigationController) return;
    if (!self.navigationController.ay_navigation.configuration.enabled) return;
    self.navigationController.navigationBar.hidden = YES;
    [self configuraNavigationBarStyle];
    [self.view addSubview:self.ay_navigationBar];
}

- (void)bringNavigationBarToFront
{
    if (!self.navigationController) return;
    if (!self.navigationController.ay_navigation.configuration.enabled) return;
    [self.view bringSubviewToFront:self.ay_navigationBar];
}

- (void)configuraNavigationBarStyle
{
    AYNavigationConfiguration *configuration = self.navigationController.ay_navigation.configuration;
    self.ay_navigationBar.barTintColor = configuration.barTintColor;
    self.ay_navigationBar.shadowImage = configuration.shadowImage;
    self.ay_navigationBar.titleTextAttributes = configuration.titleTextAttributes;
    [self.ay_navigationBar setBackgroundImage:configuration.backgroundImage forBarMetrics:UIBarMetricsDefault];
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

- (AYNavigation *)ay_navigation
{
    AYNavigation *navigation = objc_getAssociatedObject(self, _cmd);
    if (!navigation) {
        navigation = [[AYNavigation alloc] init];
        navigation.bar = self.ay_navigationBar;
        navigation.item = self.ay_navigationItem;
        navigation.configuration = [[AYNavigationConfiguration alloc] init];
        objc_setAssociatedObject(self, @selector(ay_navigation), navigation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navigation;
}

- (void)setAy_navigation:(AYNavigation *)ay_navigation
{
    objc_setAssociatedObject(self, @selector(ay_navigation), ay_navigation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UINavigationController (NavigationBar)

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    AYNavigationBar *bar = self.topViewController.ay_navigation.bar;
    CGRect frame = bar.frame;
    if (bar.isUnrestoredWhenViewDidLayoutSubviews) {
        frame.size = self.navigationBar.frame.size;
    }
    else {
        frame = self.navigationBar.frame;
    }
    bar.frame = frame;
}

@end
