//
//  UIImage+Image.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

+ (instancetype)imageOriginalWithName:(NSString *)imageName;

- (instancetype)us_circleImage;

+ (instancetype)us_circleImageNamed:(NSString *)name;
@end
