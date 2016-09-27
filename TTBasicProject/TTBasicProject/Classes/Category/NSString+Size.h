//
//  NSString+Size.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 此分类是用一个字符串计算他的高度(传进来一个size 以及font)
@interface NSString (Size)

- (CGSize)boundingRectWithSize:(CGSize)size withFont:(UIFont *)font;

@end
