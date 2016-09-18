//
//  Color.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#ifndef Color_h
#define Color_h

// 三个参数是一样的
#define     kCOLOR(a)                             [UIColor colorWithRed:a/255.0f green:a/255.0f blue:a/255.0f alpha:1.0f]
// 自定义三个参数
#define     kCustomColor(r,g,b)                   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
// 自定义三个参数和透明度
#define     kCustomColorAndAlpha(r,g,b,a)         [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]


// 传入一个6位数的颜色值和透明度
#define    kColorRGBA(c,a)                        [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:a]
// 只需要传入一个6位数的颜色值(c: 0x000000)
#define    kColorRGB(c)                           [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]


// 随机色
#define    kRandomColor                           [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]


// 主题色
#define kMainThemeColor                           kColorRGB(0x336699)
// 背景色
#define kBackgroundColor                          kColorRGB(0xf0f0f0)
// 分割线
#define kSepLineColor                             kColorRGB(0xdfdfdd)
// 灰色字体颜色
#define kGrayTextColor                            kColorRGB(0x999999)



#endif 
