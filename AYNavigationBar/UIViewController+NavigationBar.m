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

@property (nonatomic, strong) AYNavigationBar *ay__navigationBar;

@property (nonatomic, strong) UINavigationItem *ay__navigationItem;

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
    [self.view addSubview:self.ay__navigationBar];
}

- (void)bringNavigationBarToFront
{
    if (!self.navigationController) return;
    if (!self.navigationController.ay_navigation.configuration.enabled) return;
    [self.view bringSubviewToFront:self.ay__navigationBar];
}

- (void)configuraNavigationBarStyle
{
    AYNavigationConfiguration *configuration = self.navigationController.ay_navigation.configuration;
    self.ay__navigationBar.barTintColor = configuration.barTintColor;
    self.ay__navigationBar.shadowImage = configuration.shadowImage;
    self.ay__navigationBar.titleTextAttributes = configuration.titleTextAttributes;
    [self.ay__navigationBar setBackgroundImage:configuration.backgroundImage forBarPosition:configuration.position barMetrics:configuration.metrics];
}

#pragma mark - getter & setter
- (AYNavigationBar *)ay__navigationBar
{
    AYNavigationBar *navigationBar = objc_getAssociatedObject(self, _cmd);
    if (!navigationBar) {
        navigationBar = [[AYNavigationBar alloc] initWithNavigationItem:self.ay__navigationItem];
        objc_setAssociatedObject(self, @selector(ay__navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navigationBar;
}

- (void)setAy__navigationBar:(AYNavigationBar *)ay__navigationBar
{
    objc_setAssociatedObject(self, @selector(ay__navigationBar), ay__navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UINavigationItem *)ay__navigationItem
{
    UINavigationItem *navigationItem = objc_getAssociatedObject(self, _cmd);
    if (!navigationItem) {
        navigationItem = [[UINavigationItem alloc] init];
        objc_setAssociatedObject(self, @selector(ay__navigationItem), navigationItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navigationItem;
}

- (void)setAy__navigationItem:(UINavigationItem *)ay__navigationItem
{
    objc_setAssociatedObject(self, @selector(ay__navigationItem), ay__navigationItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AYNavigation *)ay_navigation
{
    AYNavigation *navigation = objc_getAssociatedObject(self, _cmd);
    if (!navigation) {
        navigation = [[AYNavigation alloc] init];
        navigation.bar = self.ay__navigationBar;
        navigation.item = self.ay__navigationItem;
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
    CGRect barFrame = self.navigationBar.frame;
    if (bar.isUnrestoredWhenViewWillLayoutSubviews) {
        frame.size = barFrame.size;
        frame.size.height = barFrame.size.height + self.ay_navigation.configuration.extraHeight;
    }
    else {
        frame = barFrame;
        frame.size.height = barFrame.size.height + self.ay_navigation.configuration.extraHeight;
        if (@available(iOS 11.0, *)) {
            if (self.navigationBar.prefersLargeTitles) frame.origin.y = CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame);
        }
    }
    bar.frame = frame;
}

@end
