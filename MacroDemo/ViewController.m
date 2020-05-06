//
//  ViewController.m
//  MacroDemo
//
//  Created by 贺文杰 on 2020/1/15.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import "ViewController.h"

#define WeakSelf(type) __weak typeof(type) weak##type = type
#define StrongSelf(type) __strong typeof(type) type = weak##type

// 当前语言
#define CURRENTLANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])

//范围内随机数
#define RANDNUM(i,j) (i + (arc4random() % (j - i + 1)))

//判断是否是arc模式
#if __has_feature(objc_arc)
#define ARCTEST(objc) NSLog(@"是ARC")
#else
#define UNARCTEST(OBJC) NSLog(@"不是ARC");
#endif


#define SSSV(s1, s2, s3, v) s1 = length * width; s2 = length * height; s3 = width * height; v = width * length * height;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int length = 3, width = 4, height = 5, sa, sb, sc, vv;
    SSSV(sa, sb, sc, vv);
    printf("sa=%d, sb=%d, sc=%d, vv=%d\n", sa, sb, sc, vv);
    
    
    
    NSLog(@"%@", CURRENTLANGUAGE);
    #pragma message("maby")
    //赋值扩展
    UIView *i = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        view.backgroundColor = [UIColor orangeColor];
        view;
    });
    [self.view addSubview:i];
    
    NSLog(@"%s", __FUNCTION__); //打印当前所在方法名称
    NSLog(@"%s", __func__); //打印当前所在方法名称
    NSLog(@"%s", __FILE__); //打印当前所在文件路径
    NSLog(@"%s", __FILE_NAME__); //获取所在文件类名及后缀名
    NSLog(@"%d", __LINE__); //输出代码所在行数
    ARCTEST(a); //判断是否是arc模式
    
    [self book];
    
    [self fly];
    
    [self language];
        
    //#if的使用
//    [self use_if];
    
    //#ifdef的使用
//    [self use_ifdef];
    
    //#ifndef的使用
//    [self use_ifndef];
}



#pragma mark -- 条件编译

/// 如常“表达式1”的值为真（非0），就对“程序段1”进行编译，否则就计算“表达式2”，结果为真的话就对“程序段2”进行编译，为假的话就继续往下匹配，直到遇到值为真的表达式，或者遇到 #else
- (void)use_if
{
    #define LIKE 2
        
    #if LIKE == 0
        NSLog(@"结果为%d", LIKE);
    #elif LIKE == 1
        NSLog(@"结果为%d", LIKE);
    #elif LIKE == 2
        NSLog(@"结果为%d", LIKE);
    #else
        NSLog(@"结果为unkonw");
    #endif
}

/// 如果当前的宏已被定义过，则对“程序段1”进行编译，否则对“程序段2”进行编译。
- (void)use_ifdef
{
    #define BOOK 3
    
    #ifdef BOOK
        NSLog(@"结果为%d", BOOK);
    #else
        NSLog(@"结果为unkonw");
    #endif
}

/// 如果当前的宏未被定义，则对“程序段1”进行编译，否则对“程序段2”进行编译，这与 #ifdef 的功能正好相反
- (void)use_ifndef
{
    #define FLY 4
    
    #ifndef FLY
        NSLog(@"结果为unkonw");
    #else
        NSLog(@"结果为%d", FLY);
    #endif
}

/// 这个宏，表示这个方法从iOS 3.0开始引入，废弃在8.0，被废弃并不是指这个方法就不存在了，意味着应该考虑将相关代码迁移到新的API上去
- (void)book NS_DEPRECATED_IOS(3_0, 8_0)
{
    NSLog(@"book");
}


/// 这个宏，表示这个方法是从Mac OS 10.8和iOS 6.0开始引入
- (void)fly NS_AVAILABLE(10_8, 6_0)
{
    NSLog(@"fly");
}


/// 表示当前api无效
- (void)language NS_UNAVAILABLE
{
    NSLog(@"language");
}

@end
