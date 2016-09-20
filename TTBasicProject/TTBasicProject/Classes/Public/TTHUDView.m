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

//#pragma mark - 设置单例对象
//+ (instancetype)sharedHUDView {
//    
//    if (_instance == nil) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _instance = [[TTHUDView alloc] init];
//        });
//    }
//    return _instance;
//}



#pragma mark -  HUD(工具类)
- (void)hudShow {
    
    if(HUD == nil) {
        
        HUD = [[MBProgressHUD alloc] initWithView:self];
        HUD.alpha = 0.4;
        [self addSubview:HUD];
        HUD.delegate = self;
        HUD.label.text = @"加载中...";
    }
    [HUD showAnimated:YES];
}

- (void)hudShow:(NSString *)content {
    
    if(textHUD == nil) {
        
        textHUD = [[MBProgressHUD alloc] initWithView:self];
        [self addSubview:textHUD];
        textHUD.delegate = self;
        textHUD.label.text = content;
    }
    [textHUD showAnimated:YES];
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
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.margin = 10.f;
    
    [hud setOffset:CGPointMake(0, kScreenHeight / 2 - 100)];
//    hud.offset.y = kScreenHeight / 2 - 100;
//    hud.yOffset = kScreenHeight / 2 - 100;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:0.8];
}

- (void)showHudSuccess:(NSString *)tip {
    
    [self showHud:tip andImg:@"TipViewIcon.png"];
}

- (void)showHudFailed:(NSString *)tip {
    
    [self showHud:tip andImg:@"TipViewErrorIcon.png"];
}

- (void)showHud:(NSString *)tip andImg:(NSString *)img {
    
    MBProgressHUD *t_HUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:t_HUD];
    t_HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:img]];
    t_HUD.mode = MBProgressHUDModeCustomView;
    t_HUD.label.text = tip;
    t_HUD.removeFromSuperViewOnHide = YES;
    [t_HUD showAnimated:YES];
    [t_HUD hideAnimated:YES afterDelay:1];
}

#pragma mark MBProgressHUDDelegate methods
- (void)hudWasHidden:(MBProgressHUD *)hud {
    
    [HUD removeFromSuperview];
    HUD = nil;
}


@end
