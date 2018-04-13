# AYNavigation

## Overview
   ![snapshot](https://github.com/CodeABug/AYNavigationBar/blob/master/demo.gif)

## Installation

Use CocoaPods  

``` ruby
   pod 'AYNavigationBar'
```

## Usage

### Import
``` objc
   #import "AYNavigation.h"
```

### To enable AYNavigationBar of a navigation controller

``` objc
   UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
   nav.ay_navigation.configuration.enabled = YES;
```
### Setting
#### global setting
``` objc
   UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
   nav.ay_navigation.configuration.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor]};
   nav.ay_navigation.configuration.barTintColor = [UIColor cyanColor];
   nav.ay_navigation.configuration.backgroundImage = [UIImage imageNamed:@"nav"];
   nav.ay_navigation.configuration.shadowImage = [UIImage imageNamed:@"shadow"];
   nav.ay_navigation.configuration.extraHeight = 14;
```
#### each setting
#### normal
``` objc
   self.ay_navigation.bar  -> UINavigationBar
   self.ay_navigation.item -> UINavigationItem
```
#### additional
``` objc
   // override alpha & backgroundColor
   self.ay_navigation.bar.alpha ->　UINavigationBar.barBackgroundView.alpha
   self.ay_navigation.bar.backgroundColor -> UINavigationBar.barTintColor
```
#### largeTitle(iOS11.0+)
``` objc
   self.navigationController.navigationBar.prefersLargeTitles = YES;
   self.ay_navigation.bar.prefersLargeTitles = YES;
```
