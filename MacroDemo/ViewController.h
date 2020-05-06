//
//  ViewController.h
//  MacroDemo
//
//  Created by 贺文杰 on 2020/1/15.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


/// 这个宏，表示这个方法从iOS 3.0开始引入，废弃在8.0，被废弃并不是指这个方法就不存在了，意味着应该考虑将相关代码迁移到新的API上去
- (void)book NS_DEPRECATED_IOS(3_0, 8_0);


/// 这个宏，表示这个方法是从Mac OS 10.8和iOS 6.0开始引入
- (void)fly NS_AVAILABLE(10_8, 6_0);


/// 表示当前api无效
- (void)language NS_UNAVAILABLE;

@end

