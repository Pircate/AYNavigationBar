//
//  UIViewController+AYNavigationBar.h
//  UIViewController+AYNavigationBar
//
//  Created by G-Xi0N on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYNavigation.h"
#import "AYNavigationBar.h"
#import "AYNavigationConfiguration.h"
#import "UIBarButtonItem+Convenience.h"

@interface UIViewController (AYNavigationBar)

@property (nonatomic, strong) AYNavigation *ay_navigation;

- (void)ay_adjustsNavigationBarPosition;

@end

@interface UINavigationController (NavigationBar)

@end
