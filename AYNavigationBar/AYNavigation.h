//
//  AYNavigation.h
//  UIViewController+AYNavigationBar
//
//  Created by GorXion on 2018/3/28.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AYNavigationBar;
@class AYNavigationConfiguration;

@interface AYNavigation : NSObject

@property (nonatomic, strong) AYNavigationBar *bar;

@property (nonatomic, strong) UINavigationItem *item;

@property (nonatomic, strong) AYNavigationConfiguration *configuration;

@end
