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

- (void)loadNoDataViewWithText:(NSString *)text andImageName:(NSString *)imageName andSuperView:(UIView *)superView {
    
    if (_noDataView == nil) {
        if (![superView isKindOfClass:[UILabel class]]) {
            _noDataView = [[UIView alloc] initWithFrame:superView.bounds];
            [superView addSubview:_noDataView];
        } else {
            _noDataView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight * 0.2, kScreenWidth, kScreenHeight * 0.8)];
            [superView.superview addSubview:_noDataView];
        }
        _noDataView.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        if (text == nil) {
            label.text = @"什么都木有，这里空空如也";
        } else {
            label.text = text;
        }
        
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = kCOLOR(204);
        label.font = [UIFont systemFontOfSize:15];
        
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.backgroundColor = [UIColor clearColor];
        iconView.image = [UIImage imageNamed:imageName];
        if (imageName == nil) {
            iconView.image = [UIImage imageNamed:@"default1"];
        } else {
            iconView.image = [UIImage imageNamed:imageName];
        }
        
        // 根据是否正在刷新调整控件的位置(headerView是否显示(高度为60))
        if ([superView isKindOfClass:[UITableView class]] || [superView isKindOfClass:[UICollectionView class]]) {
            if ([((UITableView *)superView).mj_header isRefreshing] || [((UICollectionView *)superView).mj_header isRefreshing]) {
                // 整体下移60
                label.frame = CGRectMake(0, _noDataView.height * 0.5 + 25 + 60, _noDataView.width, 30);
                iconView.frame = CGRectMake(_noDataView.width * 0.5 -75, _noDataView.height * 0.5 - 105 + 60, 150, 120);
            } else {
                label.frame = CGRectMake(0, _noDataView.height * 0.5 + 25, _noDataView.width, 30);
                iconView.frame = CGRectMake(_noDataView.width * 0.5 -75, _noDataView.height * 0.5 - 105, 150, 120);
            }
            
        } else {
            
            label.frame = CGRectMake(0, _noDataView.height * 0.5 + 25, _noDataView.width, 30);
            iconView.frame = CGRectMake(_noDataView.width * 0.5 -75, _noDataView.height * 0.5 - 105, 150, 120);
        }
        
        [_noDataView addSubview:label];
        [_noDataView addSubview:iconView];
        
    } else {
    
        for (UIView *view in self.noDataView.subviews) {
            if ([view isKindOfClass:[UILabel class]]) {
                if (text == nil) {
                    ((UILabel *)view).text = @"什么都木有，这里空空如也";
                } else {
                    ((UILabel *)view).text = text;
                }
            }
            
            if ([view isKindOfClass:[UIImageView class]]) {
                if (imageName == nil) {
                    ((UIImageView *)view).image = [UIImage imageNamed:@"default1"];
                } else {
                    ((UIImageView *)view).image = [UIImage imageNamed:imageName];
                }
            }
        }
        [superView addSubview:self.noDataView];
    }
    
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


//#pragma mark - UserData (这一堆有什么用?????)
//- (void)storeUserData:(NSMutableDictionary *)store {
//    
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userInfo"];
//    [[NSUserDefaults standardUserDefaults]setObject:store forKey:@"userInfo"];
//}
//
//- (void)storeUserNameAndPassword:(NSMutableDictionary *)dic {
//    
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"loginInfo"];
//    [[NSUserDefaults standardUserDefaults]setObject:dic forKey:@"loginInfo"];
//}
//
//- (NSDictionary *)getLoginInfo {
//    
//    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInfo"];
//    return dic;
//}
//
//- (NSMutableDictionary *)getInfoDic {
//    
//    NSMutableDictionary *dic = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"];
//    return dic;
//}
//
//#pragma mark - ASI (这一堆也是没有调用过....)
//- (NSString *)getAsiErrorInfo:(id)error {
//    
//    return @"网络似乎有问题,请检查网络";
//}
//
//- (NSString *)getasiCompeleteError:(id)result {
//    
//    NSString *str = [[result valueForKey:@"query"] valueForKey:@"reason"];
//    return str;
//}


@end
