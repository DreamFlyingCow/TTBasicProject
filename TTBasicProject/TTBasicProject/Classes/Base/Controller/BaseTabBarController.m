//
//  BaseTabBarController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //删除背景
    [self deleteBgImage];
}

//删除背景
- (void)deleteBgImage {
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBackImage.png"];
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarBackgroundView")]) {
            
            [view removeFromSuperview];
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
