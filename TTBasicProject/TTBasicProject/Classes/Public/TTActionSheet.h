//
//  TTActionSheet.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTActionSheet : NSObject<UIActionSheetDelegate>

/**
 *  标题
 */
@property (nonatomic, strong) NSArray * titles;
/**
 *  这个不设置的话默认是0(那个按钮的text会变成红色的)
 */
@property (nonatomic, assign) NSInteger destructiveButtonIndex;
/**
 *  取消按钮的index
 */
@property (nonatomic, assign) NSInteger cancelButtonIndex;

- (id)initWithTitles:(NSArray *)titles;
/**
 *  获取按钮的index
 *
 *  @param view 被添加到的view
 *
 *  @return 返回index
 */
- (NSInteger)showInView:(UIView *)view;

@end
