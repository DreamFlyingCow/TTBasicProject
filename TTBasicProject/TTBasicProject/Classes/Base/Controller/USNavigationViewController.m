//
//  USNavigationViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "USNavigationViewController.h"
#import "UIBarButtonItem+Item.h"

@interface USNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation USNavigationViewController

+ (void)load {
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 设置导航条标题 => UINavigationBar
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:attrs];
    
    // 设置导航条背景图片
    [navBar setBarTintColor:kMainThemeColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:pan];
    
    //只有非根控制器才需要触发手势
    pan.delegate = self;
    
    // 禁止之前手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)handleNavigationTransition:(UIPanGestureRecognizer *)pan {
    
    NSLog(@"%s", __FUNCTION__);
}


#pragma mark - UIGestureRecognizerDelegate
// 决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    return self.childViewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) { // 非根控制器
        
        // 恢复滑动返回功能
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置返回按钮,只有非根控制器
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:@"btn_navbar_back"] highImage:[UIImage imageNamed:@"btn_navbar_back"]  target:self action:@selector(back)];
    }
    
    // 真正在跳转
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    
    [self popViewControllerAnimated:YES];
}

@end
