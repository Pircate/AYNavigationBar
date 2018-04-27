//
//  UIBarButtonItem+Convenience.h
//  AYNavigationBarDemo
//
//  Created by GorXion on 2018/4/27.
//  Copyright © 2018年 adinnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Convenience)

+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithCustomView:(UIView *)customView;

@end
