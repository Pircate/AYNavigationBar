# AYNavigationBar

## Overview
   ![snapshot](https://github.com/CodeABug/AYNavigationBar/blob/master/demo.gif)

## Installation

Use CocoaPods  

``` ruby
pod 'AYNavigationBar'
```

## Usage

### Setting
#### global setting
``` objc
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor]};
    nav.navigationBar.barTintColor = [UIColor cyanColor];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    nav.navigationBar.shadowImage = [UIImage imageNamed:@"shadow"];
```
#### view controller setting
``` objc
    as UINavigationBar & UINavigationItem
```
