//
//  Color.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#ifndef Color_h
#define Color_h


#define     kCOLOR(a)               [UIColor colorWithRed:a/255.0f green:a/255.0f blue:a/255.0f alpha:1.0f]

#define     kCustomColor(a,b,c)     [UIColor colorWithRed:a/255.0f green:b/255.0f blue:c/255.0f alpha:1.0f]

#define     kRandomColor            [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]



#define kColorRGBA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0	\
green:((c>>8)&0xFF)/255.0	\
blue:(c&0xFF)/255.0         \
alpha:a]
#define kColorRGB(c)    [UIColor colorWithRed:((c>>16)&0xFF)/255.0	\
green:((c>>8)&0xFF)/255.0	\
blue:(c&0xFF)/255.0         \
alpha:1.0]


#endif /* Color_h */
