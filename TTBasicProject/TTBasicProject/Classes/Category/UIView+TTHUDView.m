//
//  UIView+TTHUDView.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "UIView+TTHUDView.h"

static MBProgressHUD *_HUD;
static MBProgressHUD *_textHUD;

@implementation UIView (TTHUDView)

// setter
- (void)setHUD:(MBProgressHUD *)HUD {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_HUD), HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setTextHUD:(MBProgressHUD *)textHUD {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_textHUD), textHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// getter
- (MBProgressHUD *)HUD {
    
    return objc_getAssociatedObject(self, (__bridge const void *)(_HUD));
}

- (MBProgressHUD *)textHUD {
    
    return objc_getAssociatedObject(self, (__bridge const void *)(_textHUD));
}


- (void)hudShow {
    
    if(_HUD == nil) {
        
        _HUD = [[MBProgressHUD alloc] initWithView:self];
        _HUD.alpha = 0.4;
        [self addSubview:_HUD];
        _HUD.delegate = self;
        _HUD.label.text = @"加载中...";
    }
    [_HUD showAnimated:YES];
}

- (void)hudShow:(NSString *)content {
    
    if(_textHUD == nil) {
        
        _textHUD = [[MBProgressHUD alloc] initWithView:self];
        [self addSubview:_textHUD];
        _textHUD.delegate = self;
        _textHUD.label.text = content;
    }
    [_textHUD showAnimated:YES];
}

- (void)hiddleHud {
    
    if (_HUD != nil) {
        
        [_HUD removeFromSuperview];
        _HUD = nil;
    }
    
}

- (void)textHUDHiddle {
    
    if (_textHUD != nil) {
        
        [_textHUD removeFromSuperview];
        _textHUD = nil;
    }
    
}

- (void)hudShowWithText:(NSString *)text {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.margin = 10.f;
    [hud setOffset:CGPointMake(0, kScreenHeight / 2 - 100)];
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
    
    [_HUD removeFromSuperview];
    _HUD = nil;
}


@end
