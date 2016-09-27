//
//  AppDelegate.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "AppDelegate.h"
#import "TTTabBarViewController.h"
#import "TTTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TTTabBarController *tabVC = [[TTTabBarController alloc] init];
    
//    TTTabBarViewController *tabVC = [[TTTabBarViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

// 即将失去活跃状态
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

// 已经失去活跃状态
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

// 即将进入前台(变得活跃)
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

// 已经变得活跃(进入前台)
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    // app图标右上角显示的数字
    [application setApplicationIconBadgeNumber:0];
}

// app将要退出
- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
