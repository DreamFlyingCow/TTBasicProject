//
//  NSString+StringColor.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringColor)

// 次方法用于对某一控件的text中的某一范围内的文字设置颜色
- (NSMutableAttributedString *)addStringWithDifferentColor:(UIColor *)color withRange:(NSRange)range;

@end
