//
//  GXNavigationBar.h
//  UIViewController+AYNavigationBar
//
//  Created by Pircate on 2018/3/26.
//  Copyright © 2018年 Pircate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYNavigationBar : UINavigationBar

/**
 Default is false. If set true, navigation bar will not restore when the UINavigationController call viewWillLayoutSubviews
 */
@property (nonatomic, assign) BOOL isUnrestoredWhenViewWillLayoutSubviews;

@property (nonatomic, assign) CGFloat extraHeight;

- (instancetype)initWithNavigationItem:(UINavigationItem *)navigationItem;

@end
