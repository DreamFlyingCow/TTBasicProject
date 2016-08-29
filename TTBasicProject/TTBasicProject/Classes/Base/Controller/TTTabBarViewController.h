//
//  TTTabBarViewController.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"

#import "TTFirstPageViewController.h"
#import "TTSecondPageViewController.h"
#import "TTThirdPageViewController.h"
#import "TTForthPageViewController.h"

@interface TTTabBarViewController : BaseTabBarController
@property (nonatomic ,strong) UILabel *msgMarkLab;

//切换按钮
@property (strong, nonatomic) NSMutableArray *btnArray;
@property (strong, nonatomic) BaseNavigationController *firstNav;
@property (strong, nonatomic) BaseNavigationController *secondNav;
@property (strong, nonatomic) BaseNavigationController *thirdNav;
@property (strong, nonatomic) BaseNavigationController *forthNav;


@property (strong, nonatomic) TTFirstPageViewController *firstVC;
@property (strong, nonatomic) TTSecondPageViewController *secondVC;
@property (strong, nonatomic) TTThirdPageViewController *thirdVC;
@property (strong, nonatomic) TTForthPageViewController *forthVC;



- (void)SelectedIndex:(NSUInteger)selectedIndex;

+ (void)refreshTabbarCount;


@end
