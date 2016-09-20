//
//  TTAlertView.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTAlertView.h"

@interface TTAlertView () <UIAlertViewDelegate>

@property (copy, nonatomic) void (^clickedBlock)(TTAlertView *, BOOL, NSInteger);

@end

@implementation TTAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(void (^)(TTAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {

    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self) {
        _clickedBlock = clickedBlock;
        va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [self addButtonWithTitle:key];
        }
        va_end(_arguments);
    }
    
    if (cancelButtonTitle == nil && otherButtonTitles == nil) {
        // 取消按钮可以传nil, 其他按钮也可以传nil, 两个同时为nil时, 提醒框就会显示一秒钟之后就消失
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            [self dismissWithClickedButtonIndex:0 animated:YES];
        });
    }
    
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    _clickedBlock(self, buttonIndex == self.cancelButtonIndex, buttonIndex);
}

@end
