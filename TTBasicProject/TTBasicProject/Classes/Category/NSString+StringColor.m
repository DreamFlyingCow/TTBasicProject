//
//  NSString+StringColor.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "NSString+StringColor.h"

// 可以设置多个位置多种颜色
//    [attStr addAttributes:<#(nonnull NSDictionary<NSString *,id> *)#> range:<#(NSRange)#>];
//    [attStr addAttributes: @{NSForegroundColorAttributeName: [UIColorredColor]}range: range];
//    [attStr addAttributes: @{NSForegroundColorAttributeName: [UIColorgreenColor]}range: NSMakeRange(0, range.location)];
//    [attStr addAttributes: @{NSForegroundColorAttributeName: [UIColorcyanColor]}range: NSMakeRange(range.location+ range.length, 5)];

@implementation NSString (StringColor)

- (NSMutableAttributedString *)addStringWithDifferentColor:(UIColor *)color withRange:(NSRange)range {
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return attStr;
}

@end
