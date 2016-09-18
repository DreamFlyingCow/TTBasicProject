//
//  UIView+Image.m
//  UnicornSeller
//
//  Created by 赵春浩 on 16/9/14.
//  Copyright © 2016年 Unicorn. All rights reserved.
//

#import "UIView+Image.h"

@implementation UIView (Image)

- (UIImage *)buttonImageFromColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, self.width, self.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
