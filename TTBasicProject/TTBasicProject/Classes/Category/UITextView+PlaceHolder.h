//
//  UITextView+PlaceHolder.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@protocol UITextViewPlaceHolderDelegate <NSObject>

@optional
- (void)finishInputTextWithString:(NSString *)string;

@end


@interface UITextView (PlaceHolder) <UITextViewDelegate>

// 用来处理输入完成的代理
@property (weak, nonatomic) id<UITextViewPlaceHolderDelegate> placeHolderDelegate;

// 设置占位字符串
- (void)addPlaceHolder:(NSString *)placeHolder;

@end
