//
//  BaseViewController.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (strong, nonatomic) UIButton *retBtn;
//自定义navigationBar
@property (strong, nonatomic) UIView *navView;

@property (strong, nonatomic) UILabel *titleLab;
@property (nonatomic, strong) UIActivityIndicatorView *spinnerView;

- (void)addNavBarViewAndTitle:(NSString *)title;
- (void)addNavBarViewTitleAndWithActivity:(NSString *)title;

- (void)returnBtnClicked:(UIButton *)button;

- (void)showInView:(UIView *)view WithPoint:(CGPoint)point andHeight:(CGFloat)height;
- (void)activityDismiss;
@end
