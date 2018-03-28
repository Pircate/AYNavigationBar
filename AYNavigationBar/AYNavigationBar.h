//
//  GXNavigationBar.h
//  UIViewController+NavigationBar
//
//  Created by G-Xi0N on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYNavigationBar : UINavigationBar

/**
 Default is false. If set true, navigation bar will not restore when the UINavigationController call viewDidLayoutSubviews
 */
@property (nonatomic, assign) BOOL isUnrestoredWhenViewDidLayoutSubviews;

- (instancetype)initWithNavigationItem:(UINavigationItem *)navigationItem;

@end
