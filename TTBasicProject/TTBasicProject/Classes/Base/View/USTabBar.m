//
//  USTabBar.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "USTabBar.h"

@interface USTabBar ()
/**
 *  上一次点击的按钮
 */
@property (nonatomic, weak) UIControl *previousClickedTabBarButton;

@end


@implementation USTabBar

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 跳转tabBarButton位置
    NSInteger count = self.items.count;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height;
    CGFloat x = 0;
    int i = 0;
    // 遍历子控件 调整布局
    for (UIControl *tabBarButton in self.subviews) {

        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            // 设置previousClickedTabBarButton默认值为最前面的按钮
            if (i == 0 && self.previousClickedTabBarButton == nil) {
                self.previousClickedTabBarButton = tabBarButton;
            }
            
            x = i * btnW;
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            i ++;
            
            // UIControlEventTouchDownRepeat : 在短时间内连续点击按钮
            // 监听点击
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

/**
 *  tabBarButton的点击
 */
- (void)tabBarButtonClick:(UIControl *)tabBarButton {
    
    self.previousClickedTabBarButton = tabBarButton;
}

@end
