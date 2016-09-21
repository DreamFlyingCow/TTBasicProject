//
//  BaseViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"
@interface BaseViewController ()

@property (nonatomic ,strong) UIView *hudBgView;

@end

@implementation BaseViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //设置视图是否延伸到StatusBar的后面
    if (kCurrentFloatDevice >= 7.0) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
        //刷新状态栏样式
        [self setNeedsStatusBarAppearanceUpdate];
    }    
    self.view.backgroundColor = [UIColor whiteColor];
    
}



- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)returnBtnClicked:(UIButton *)button {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addNavBarViewAndTitle:(NSString *)title {
    
    //navigationBar
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    self.navView.backgroundColor = kCOLOR(50);
    [self.view addSubview:self.navView];
    //title
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.center = CGPointMake(self.navView.center.x, self.navView.center.y + 10);
    titleLab.bounds = CGRectMake(0, 0, kScreenWidth / 3, 44);
    titleLab.text = title;
    titleLab.backgroundColor = [UIColor clearColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor whiteColor];
    titleLab.font =[UIFont systemFontOfSize:17];
    titleLab.shadowOffset = CGSizeMake(0, 1);
    [self.navView addSubview:titleLab];
    //返回按钮
    self.retBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.retBtn.frame = CGRectMake(0, 10, 44, 64);
    self.retBtn.backgroundColor = [UIColor clearColor];
    [self.retBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    self.retBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.retBtn addTarget:self action:@selector(returnBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.retBtn setImage:[UIImage imageNamed:@"button_nav_back"] forState:(UIControlStateNormal)];
    [self.navView addSubview:self.retBtn];
    
}
- (void)addNavBarViewTitleAndWithActivity:(NSString *)title {
    
    //navigationBar
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    self.navView.backgroundColor = kCOLOR(50);
    [self.view addSubview:self.navView];
    //title
    _titleLab = [[UILabel alloc] init];
    _titleLab.center = CGPointMake(self.navView.center.x, self.navView.center.y + 10);
    _titleLab.bounds = CGRectMake(0, 0, kScreenWidth / 3, 44);
    _titleLab.text = title;
    _titleLab.backgroundColor = [UIColor clearColor];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.textColor = [UIColor whiteColor];
    _titleLab.font = [UIFont systemFontOfSize:17];
    _titleLab.shadowOffset = CGSizeMake(0, 1);
    [self.navView addSubview:_titleLab];
    
    _spinnerView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _spinnerView.frame = CGRectMake(_titleLab.left - 8, self.navView.center.y - 8, 37, 37);
    [self.navView addSubview:_spinnerView];
    [_spinnerView startAnimating];
    
    
}


- (void)showInView:(UIView *)view WithPoint:(CGPoint)point andHeight:(CGFloat)height {
    
    [self showWithStatus:view WithPoint:point andHeight:height];
}

- (void)showWithStatus:(UIView *)view WithPoint:(CGPoint)point andHeight:(CGFloat)height {
    
    _hudBgView = [[UIView alloc] init];
    _hudBgView.frame = CGRectMake(point.x, point.y, kScreenWidth, height);
    _hudBgView.backgroundColor = [UIColor whiteColor];
    [view addSubview:_hudBgView];
    
    _spinnerView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _spinnerView.hidesWhenStopped = YES;
    _spinnerView.bounds = CGRectMake(0, 0, 37, 37);
    _spinnerView.center = CGPointMake(kScreenWidth/2, self.hudBgView.height/2);
    [_hudBgView addSubview:_spinnerView];
    [_spinnerView startAnimating];
}

- (void)activityDismiss {
    
    [self.hudBgView removeFromSuperview];
}

@end
