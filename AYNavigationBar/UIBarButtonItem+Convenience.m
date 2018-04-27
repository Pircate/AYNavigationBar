//
//  UIBarButtonItem+Convenience.m
//  AYNavigationBarDemo
//
//  Created by GorXion on 2018/4/27.
//  Copyright © 2018年 adinnet. All rights reserved.
//

#import "UIBarButtonItem+Convenience.h"

@implementation UIBarButtonItem (Convenience)

+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIImage *originalImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return [[UIBarButtonItem alloc] initWithImage:originalImage style:UIBarButtonItemStylePlain target:target action:action];
}

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
}

+ (instancetype)itemWithCustomView:(UIView *)customView
{
    return [[UIBarButtonItem alloc] initWithCustomView:customView];
}

@end
