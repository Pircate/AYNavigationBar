//
//  UIViewController+NavigationBar.h
//  UIViewController+NavigationBar
//
//  Created by G-Xi0N on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYNavigationBar.h"

@interface UIViewController (NavigationBar)

@property (nonatomic, strong) AYNavigationBar *ay_navigationBar;

@property (nonatomic, strong) UINavigationItem *ay_navigationItem;

@end

@interface UINavigationController (NavigationBar)

@end
