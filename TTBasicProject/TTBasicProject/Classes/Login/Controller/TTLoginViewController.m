//
//  TTLoginViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTLoginViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface TTLoginViewController ()<UITextFieldDelegate>

@end

@implementation TTLoginViewController


- (void)viewWillAppear:(BOOL)animated {
 
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = NO;
    manager.enableAutoToolbar = NO;
    manager.shouldResignOnTouchOutside = NO;
    manager.shouldToolbarUsesTextFieldTintColor = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setUpUI];
}

#pragma mark - 创建子视图
- (void)setUpUI {
    
    // 顶部icon
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"image_login_logo"];
    [self.view addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@110);
        make.height.equalTo(@44);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(50);
    }];
    
    // 请输入手机号
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.height.equalTo(@60);
        make.top.equalTo(iconView.mas_bottom).with.offset(50);
    }];
    
    UIImageView *topIcon = [[UIImageView alloc] init];
    topIcon.image = [UIImage imageNamed:@"icon_shoujihao"];
    [topView addSubview:topIcon];
    [topIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(topView).with.offset(20);
        make.width.height.equalTo(@20);
        make.centerY.equalTo(topView);
    }];
    
    UITextField *topTF = [[UITextField alloc] init];
    topTF.placeholder = @"请输入手机号";
    topTF.font = [UIFont systemFontOfSize:15];
    topTF.keyboardType = UIKeyboardTypeNumberPad;
    topTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    topTF.delegate = self;
    [topView addSubview:topTF];
    [topTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(topIcon.mas_right).with.offset(10);
        make.right.centerY.equalTo(topView);
    }];
    [topTF becomeFirstResponder];
    
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = kSepLineColor;
    [topView addSubview:topLine];
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.width.bottom.equalTo(topView);
        make.height.equalTo(@0.5);
    }];
    
    // 请输入验证码
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.height.equalTo(topView);
        make.top.equalTo(topView.mas_bottom);
    }];
    
    UIImageView *bottomIcon = [[UIImageView alloc] init];
    bottomIcon.image = [UIImage imageNamed:@"icon_yanzhengma"];
    [bottomView addSubview:bottomIcon];
    [bottomIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottomView).with.offset(20);
        make.width.height.equalTo(@20);
        make.centerY.equalTo(bottomView);
    }];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.backgroundColor = kMainThemeColor;
    [testBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [testBtn addTarget:self action:@selector(testBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:testBtn];
    [testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.centerY.equalTo(bottomView);
        make.width.equalTo(@85);
    }];
    testBtn.layer.cornerRadius = 3;
    testBtn.layer.masksToBounds = YES;
    
    UITextField *bottomTF = [[UITextField alloc] init];
    bottomTF.font = [UIFont systemFontOfSize:15];
    bottomTF.placeholder = @"请输入验证码";
    bottomTF.keyboardType = UIKeyboardTypeNumberPad;
    bottomTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    bottomTF.delegate = self;
    [bottomView addSubview:bottomTF];
    [bottomTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottomIcon.mas_right).with.offset(10);
        make.right.equalTo(testBtn.mas_left);
        make.centerY.equalTo(bottomView);
    }];
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = kSepLineColor;
    [bottomView addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.width.bottom.equalTo(bottomView);
        make.height.equalTo(@0.5);
    }];
    
    // 登录按钮
    UIButton *loginBtn = [[UIButton alloc] init];
    loginBtn.backgroundColor = kMainThemeColor;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(topView);
        make.height.equalTo(@44);
        make.top.equalTo(bottomView.mas_bottom).with.offset(30);
    }];
    loginBtn.layer.cornerRadius = 22;
    loginBtn.layer.masksToBounds = YES;
}


#pragma mark - 验证码按钮的点击事件
- (void)testBtnClick:(UIButton *)testBtn {
    
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - 登录按钮的点击事件
- (void)loginBtnClick:(UIButton *)loginBtn {
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.enableAutoToolbar = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



@end
