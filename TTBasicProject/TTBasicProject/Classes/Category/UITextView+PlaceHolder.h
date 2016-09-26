//
//  UITextView+PlaceHolder.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITextView (PlaceHolder) <UITextViewDelegate>

// 设置占位字符串
- (void)addPlaceHolder:(NSString *)placeHolder;

@end
