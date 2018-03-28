//
//  AYNavigationBar.m
//  UIViewController+NavigationBar
//
//  Created by G-Xi0N on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import "AYNavigationBar.h"

@interface AYNavigationBar()

@property (nonatomic, assign) CGFloat barBackgroundAlpha;

@end

@implementation AYNavigationBar

- (instancetype)initWithNavigationItem:(UINavigationItem *)navigationItem
{
    CGRect frame;
    BOOL isLandscape = UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation);
    frame.origin.y = isLandscape ? 0 : CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame);
    self = [super initWithFrame:frame];
    if (self) {
        _barBackgroundAlpha = 1;
        [self setItems:@[navigationItem]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.subviews.firstObject.alpha = _barBackgroundAlpha;
    self.subviews.firstObject.frame = CGRectMake(0, -CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame), self.bounds.size.width, self.bounds.size.height + CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame));
    UIVisualEffectView *visualEffectView = (UIVisualEffectView *)self.subviews.firstObject.subviews.lastObject;
    if ([visualEffectView isKindOfClass:[UIVisualEffectView class]]) {
        visualEffectView.contentView.backgroundColor = self.barTintColor;
    }
}

- (CGFloat)alpha
{
    return _barBackgroundAlpha;
}

- (void)setAlpha:(CGFloat)alpha
{
    _barBackgroundAlpha = alpha;
    self.subviews.firstObject.alpha = alpha;
}

- (UIColor *)backgroundColor
{
    return self.barTintColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.barTintColor = backgroundColor;
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
    [super setBarTintColor:barTintColor];
    UIVisualEffectView *visualEffectView = (UIVisualEffectView *)self.subviews.firstObject.subviews.lastObject;
    if ([visualEffectView isKindOfClass:[UIVisualEffectView class]]) {
        visualEffectView.contentView.backgroundColor = self.barTintColor;
    }
}

@end
