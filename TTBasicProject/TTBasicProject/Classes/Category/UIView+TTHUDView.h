//
//  UIView+TTHUDView.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TTHUDView)<MBProgressHUDDelegate>

- (void)hudShow;
- (void)hudShow:(NSString *)content;
- (void)hiddleHud;
- (void)textHUDHiddle;
- (void)hudShowWithText:(NSString *)text;
- (void)showHudSuccess:(NSString *)tip;
- (void)showHudFailed:(NSString *)tip;
- (void)showHud:(NSString *)tip andImg:(NSString *)img;

@end
