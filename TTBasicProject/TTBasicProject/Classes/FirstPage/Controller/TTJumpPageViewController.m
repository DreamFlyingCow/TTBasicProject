//
//  TTJumpPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/26.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTJumpPageViewController.h"
#import "UITextView+PlaceHolder.h"

@interface TTJumpPageViewController ()

@end

@implementation TTJumpPageViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.title = @"跳转页";
    [self addSubViews];
}

- (void)addSubViews {
    
    UITextView *TF = [[UITextView alloc] initWithFrame:CGRectMake(50, 200, 200, 200)];
    TF.layer.cornerRadius = 5;
    TF.layer.masksToBounds = YES;
    [TF addPlaceHolder:@"请输入占位符"];
    [self.view addSubview:TF];
}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



@end
