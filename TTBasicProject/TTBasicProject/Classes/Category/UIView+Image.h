//
//  UIView+Image.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Image)
/**
 *  通过颜色来生成一个纯色图片
 *
 *  @param color 所需的颜色
 *
 *  @return 生成的图片
 */
- (UIImage *)buttonImageFromColor:(UIColor *)color;

@end
