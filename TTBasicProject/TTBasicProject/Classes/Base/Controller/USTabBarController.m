//
//  USTabBarController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "USTabBarController.h"
#import "USTabBar.h"
#import "USNavigationViewController.h"
#import "UIImage+Image.h"
#import "TTFirstPageViewController.h"
#import "TTSecondPageViewController.h"
#import "TTThirdPageViewController.h"
#import "TTForthPageViewController.h"
#import "TTFifthPageViewController.h"


@interface USTabBarController ()

@end

@implementation USTabBarController
+ (void)load {
    // 获取哪个类中UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸 -UIControlStateNormal
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
    
    // 设置字体尺寸 -UIControlStateSelected
    NSMutableDictionary *attrsNorS = [NSMutableDictionary dictionary];
    attrsNorS[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    attrsNorS[NSForegroundColorAttributeName] = [UIColor colorWithRed:51/255.0f green:102/255.0f blue:153/255.0f alpha:1.0];
    [item setTitleTextAttributes:attrsNorS forState:UIControlStateSelected];
    
}

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 1 添加子控制器
    [self setupAllChildViewController];
    
    // 2 设置tabBar上按钮内容 -> 由对应的子控制器的tabBarItem属性
    [self setupAllTitleButton];
    
    // 3.自定义tabBar
    [self setupTabBar];
}

#pragma mark - 自定义tabBar
- (void)setupTabBar {
    
    USTabBar *tabBar = [[USTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}

#pragma mark - 添加所有子控制器
- (void)setupAllChildViewController {
    
    // 首页
     TTFirstPageViewController *OneVc = [[TTFirstPageViewController alloc] init];
    USNavigationViewController *navOne = [[USNavigationViewController alloc] initWithRootViewController:OneVc];
    [self addChildViewController:navOne];
    
    // 二页
    TTSecondPageViewController *twoVC = [[TTSecondPageViewController alloc] init];
    USNavigationViewController *navTwo = [[USNavigationViewController alloc] initWithRootViewController:twoVC];
    [self addChildViewController:navTwo];
    
    // 三页
    TTThirdPageViewController *threeVC = [[TTThirdPageViewController alloc] init];
    USNavigationViewController *navThree = [[USNavigationViewController alloc] initWithRootViewController:threeVC];
    [self addChildViewController:navThree];
    
    // 四页
    TTForthPageViewController *fourVC = [[TTForthPageViewController alloc] init];
    USNavigationViewController *navFour = [[USNavigationViewController alloc] initWithRootViewController:fourVC];
    [self addChildViewController:navFour];
    
    // 末页
    TTFifthPageViewController *fiveVC = [[TTFifthPageViewController alloc] init];
    USNavigationViewController *navFive = [[USNavigationViewController alloc] initWithRootViewController:fiveVC];
    [self addChildViewController:navFive];
    
}

// 设置tabBar上所有按钮内容
- (void)setupAllTitleButton {
    
    // 0:首页
    UINavigationController *navOne = self.childViewControllers[0];
    navOne.tabBarItem.title = @"首页";
    navOne.tabBarItem.image = [UIImage imageNamed:@"me_normal"];
    navOne.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"me_selected"];
    
    // 1:二页
    UINavigationController *navTwo = self.childViewControllers[1];
    navTwo.tabBarItem.title = @"二页";
    navTwo.tabBarItem.image = [UIImage imageNamed:@"privatemessage_normal"];
    navTwo.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"privatemessage_selected"];
    
    // 2.三页
    UINavigationController *navThree = self.childViewControllers[2];
    navThree.tabBarItem.title = @"三页";
    navThree.tabBarItem.image = [UIImage imageNamed:@"project_normal"];
    navThree.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"project_selected"];
    
    // 3.四页
    UINavigationController *navFour = self.childViewControllers[3];
    navFour.tabBarItem.title = @"四页";
    navFour.tabBarItem.image = [UIImage imageNamed:@"task_normal"];
    navFour.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"task_selected"];
    
    // 4.末页
    UINavigationController *navFive = self.childViewControllers[4];
    navFive.tabBarItem.title = @"末页";
    navFive.tabBarItem.image = [UIImage imageNamed:@"tweet_normal"];
    navFive.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tweet_selected"];
}

@end
