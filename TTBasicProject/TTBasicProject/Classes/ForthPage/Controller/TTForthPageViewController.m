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
    [self addSubviews];
}

// 添加四个子控件(按钮)
- (void)addSubviews {
    
    UIButton *oneBtn = [[UIButton alloc] init];
    [oneBtn setBackgroundColor:kRandomColor];
    oneBtn.layer.cornerRadius = 5;
    oneBtn.layer.masksToBounds = YES;
    [oneBtn setTitle:@"加载" forState:UIControlStateNormal];
    [oneBtn addTarget:self action:@selector(oneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneBtn];
    [oneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.height.equalTo(@80);
        make.centerY.equalTo(self.view).offset(-90);
    }];
    
    UIButton *twoBtn = [[UIButton alloc] init];
    [twoBtn setBackgroundColor:kRandomColor];
    twoBtn.layer.cornerRadius = 5;
    twoBtn.layer.masksToBounds = YES;
    [twoBtn setTitle:@"成功" forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(twoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twoBtn];
    [twoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(oneBtn);
        make.width.height.equalTo(oneBtn.mas_height);
        make.top.equalTo(oneBtn.mas_bottom).offset(20);
    }];
    
    UIButton *threeBtn = [[UIButton alloc] init];
    [threeBtn setBackgroundColor:kRandomColor];
    threeBtn.layer.cornerRadius = 5;
    threeBtn.layer.masksToBounds = YES;
    [threeBtn setTitle:@"提示" forState:UIControlStateNormal];
    [threeBtn addTarget:self action:@selector(threeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:threeBtn];
    [threeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(oneBtn);
        make.width.height.equalTo(oneBtn.mas_height);
        make.top.equalTo(twoBtn.mas_bottom).offset(20);
    }];
 
    
    UIButton *fourBtn = [[UIButton alloc] init];
    [fourBtn setBackgroundColor:kRandomColor];
    fourBtn.layer.cornerRadius = 5;
    fourBtn.layer.masksToBounds = YES;
    [fourBtn setTitle:@"文字" forState:UIControlStateNormal];
    [fourBtn addTarget:self action:@selector(fourBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fourBtn];
    [fourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(oneBtn);
        make.width.height.equalTo(oneBtn);
        make.bottom.equalTo(oneBtn.mas_top).offset(-20);
    }];
}

- (void)oneBtnClick:(UIButton *)btn {
    
    NSLog(@"这是第四个控制器");
    [self.view hudShow];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self.view hiddleHud];
    });
}

- (void)twoBtnClick:(UIButton *)btn {
    
    NSLog(@"这是第四个控制器");
    [self.view showHudSuccess:@"成功了"];
}

- (void)threeBtnClick:(UIButton *)btn {
    
    NSLog(@"这是第四个控制器");
    [self.view hudShowWithText:@"这个东西在哪里呢"];
}

- (void)fourBtnClick:(UIButton *)btn {
    
    NSLog(@"这是第四个控制器");
    [self.view hudShow:@"可编辑文字"];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self.view textHUDHiddle];
    });
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
