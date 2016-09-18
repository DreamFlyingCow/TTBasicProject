//
//  TTForthPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTForthPageViewController.h"

@interface TTForthPageViewController ()

@end

@implementation TTForthPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    
    UIButton *btn = [[UIButton alloc] init];
    btn.size = CGSizeMake(50, 50);
    btn.backgroundColor = kRandomColor;
    [self.view addSubview:btn];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClick:(UIButton *)btn {
    
    NSLog(@"这是第四个控制器");
    
    [[TTHUDView sharedHUDView] hudShow];
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
