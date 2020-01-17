//
//  ViewController.m
//  MacroDemo
//
//  Created by 贺文杰 on 2020/1/15.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import "ViewController.h"

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
    
    [self book];
}

- (void)book
{
    
}

- (void)fly
{
    
}

@end
