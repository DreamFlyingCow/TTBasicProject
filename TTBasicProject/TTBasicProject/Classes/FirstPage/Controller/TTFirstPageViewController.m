//
//  TTFirstPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTFirstPageViewController.h"
#import "TTAlertView.h"
#import "TTActionSheet.h"

@interface TTFirstPageViewController ()

@end

@implementation TTFirstPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kColorRGB(0x623456);
    self.navigationController.navigationBar.hidden = YES;
    [self addSubviews];
}

// 添加两个子控件(按钮)
- (void)addSubviews {
    
    UIButton *alertViewBtn = [[UIButton alloc] init];
    [alertViewBtn setBackgroundColor:kRandomColor];
    [alertViewBtn setTitle:@"哈哈" forState:UIControlStateNormal];
    [alertViewBtn addTarget:self action:@selector(alertViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertViewBtn];
    [alertViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.height.equalTo(@80);
        make.centerY.equalTo(self.view).offset(-90);
    }];
    
    UIButton *actionSheetBtn = [[UIButton alloc] init];
    [actionSheetBtn setBackgroundColor:kRandomColor];
    [actionSheetBtn setTitle:@"呵呵" forState:UIControlStateNormal];
    [actionSheetBtn addTarget:self action:@selector(actionSheetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionSheetBtn];
    [actionSheetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alertViewBtn);
        make.width.height.equalTo(alertViewBtn.mas_height);
        make.top.equalTo(alertViewBtn.mas_bottom).offset(20);
    }];
    
}


- (void)alertViewBtnClick:(UIButton *)btn {
    
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"提示" message:@"这只是一个测试" clickedBlock:^(TTAlertView *alertView, BOOL cancelled, NSInteger buttonIndex) {
        // 这里也可以用buttonIndex来做判断
        if (!cancelled) {
            NSLog(@"呵呵");
        }
    } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertView show];
}

- (void)actionSheetBtnClick:(UIButton *)btn {
    
//    TTActionSheet *actionSheet = [[TTActionSheet alloc] initWithTitles:[NSArray arrayWithObjects:@"呵呵", @"哈哈", @"嗯嗯", @"取消", nil]];
    
    TTActionSheet *actionSheet = [[TTActionSheet alloc] init];
    actionSheet.titles = [NSArray arrayWithObjects:@"呵呵", @"哈哈", @"嗯嗯", @"取消", nil];
    actionSheet.destructiveButtonIndex = 1;
    // 可以单独设置取消按钮是哪一个(会被放在最下边)
    actionSheet.cancelButtonIndex = 2;
    
    // 拿到用户点击的按钮的index, 判断之后进行点击事件的处理
    NSUInteger index = [actionSheet showInView:self.view];
    NSLog(@"result = %ld", index);
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
