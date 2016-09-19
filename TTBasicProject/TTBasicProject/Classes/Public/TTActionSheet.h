//
//  TTActionSheet.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTActionSheet : NSObject<UIActionSheetDelegate>

@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, assign) NSInteger destructiveButtonIndex;
@property (nonatomic, assign) NSInteger cancelButtonIndex;


- (id)initWithTitles:(NSArray *)titles;

- (NSInteger)showInView:(UIView *)view;

@end
