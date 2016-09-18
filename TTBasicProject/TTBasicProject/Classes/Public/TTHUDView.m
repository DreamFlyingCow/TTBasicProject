//
//  TTHUDView.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTHUDView.h"

#define kKeyWindow [UIApplication sharedApplication].keyWindow
static id _instance;
@interface TTHUDView ()<MBProgressHUDDelegate>

@end


@implementation TTHUDView {
    
    MBProgressHUD *HUD;
    MBProgressHUD *textHUD;
}

#pragma mark - 设置单例对象
+ (instancetype)sharedHUDView {
    
    if (_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[TTHUDView alloc] init];
        });
    }
    return _instance;
}



#pragma mark -  HUD(工具类)
- (void)hudShow {
    
    if(HUD == nil) {
        
        HUD = [[MBProgressHUD alloc] initWithView:kKeyWindow];
        HUD.alpha = 0.4;
        [kKeyWindow addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"加载中...";
    }
    [HUD show:YES];
}

- (void)hudShow:(NSString *)content {
    
    if(textHUD == nil) {
        
        textHUD = [[MBProgressHUD alloc] initWithView:kKeyWindow];
        [kKeyWindow addSubview:textHUD];
        textHUD.delegate = self;
        textHUD.labelText = content;
    }
    [textHUD show:YES];
}

- (void)hiddleHud {
    
    if (HUD != nil) {
        
        [HUD removeFromSuperview];
        HUD = nil;
    }
    
}

- (void)textHUDHiddle {
    
    if (textHUD != nil) {
        
        [textHUD removeFromSuperview];
        textHUD = nil;
    }
    
}

- (void)hudShowWithText:(NSString *)text {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    hud.yOffset = kScreenHeight/2-100;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:0.8];
}

- (void)showHudSuccess:(NSString *)tip {
    
    [self showHud:tip andImg:@"TipViewIcon.png"];
}

- (void)showHudFailed:(NSString *)tip {
    
    [self showHud:tip andImg:@"TipViewErrorIcon.png"];
}

- (void)showHud:(NSString *)tip andImg:(NSString *)img {
    
    MBProgressHUD *t_HUD = [[MBProgressHUD alloc] initWithView:kKeyWindow];
    [kKeyWindow addSubview:t_HUD];
    t_HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:img]];
    t_HUD.mode = MBProgressHUDModeCustomView;
    t_HUD.labelText = tip;
    t_HUD.removeFromSuperViewOnHide = YES;
    [t_HUD show:YES];
    [t_HUD hide:YES afterDelay:1];
}

#pragma mark MBProgressHUDDelegate methods
- (void)hudWasHidden:(MBProgressHUD *)hud {
    
    [HUD removeFromSuperview];
    HUD = nil;
}


@end
