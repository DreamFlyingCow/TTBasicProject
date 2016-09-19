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
    
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    _clickedBlock(self, buttonIndex==self.cancelButtonIndex, buttonIndex);
}

@end
