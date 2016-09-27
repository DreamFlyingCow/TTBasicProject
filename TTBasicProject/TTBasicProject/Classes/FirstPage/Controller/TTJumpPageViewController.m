//
//  TTJumpPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/26.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTJumpPageViewController.h"
#import "UITextView+PlaceHolder.h"
#import "NSString+StringColor.h"

@interface TTJumpPageViewController ()<UITextViewPlaceHolderDelegate>

@property (strong, nonatomic) UITextView *TF;

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
    
    _TF = [[UITextView alloc] initWithFrame:CGRectMake(50, 200, 200, 200)];
    _TF.layer.cornerRadius = 5;
    _TF.layer.masksToBounds = YES;
    _TF.placeHolderDelegate = self;
    [_TF addPlaceHolder:@"请输入占位符"];
    _TF.text = @"哈哈哈哈哈哈哈哈哈哈哈哈";
    
    [self.view addSubview:_TF];
}


- (void)finishInputTextWithString:(NSString *)string {
    
    // 利用分类对textView的text进行染色
    _TF.attributedText = [string addStringWithDifferentColor:[UIColor greenColor] withRange:NSMakeRange(0, string.length)];
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



@end
