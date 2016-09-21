//
//  USTCustomerHeaderView.m
//  UnicornSeller
//
//  Created by 赵春浩 on 16/9/7.
//  Copyright © 2016年 Unicorn. All rights reserved.
//

#import "TTCustomerHeaderView.h"
#import "UIView+TTDraggable.h"

@interface TTCustomerHeaderView ()
/**
 *  iconView后边的背景视图
 */
@property (weak, nonatomic) IBOutlet UIView *bgView;
/**
 *  名字Label
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/**
 *  会员活跃度等级Label
 */
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;

@end



@implementation TTCustomerHeaderView


- (void)drawRect:(CGRect)rect {
    
    self.bgView.layer.cornerRadius = self.bgView.width * 0.5;
    self.bgView.layer.masksToBounds = YES;
    
    self.iconView.layer.cornerRadius = self.iconView.width * 0.5;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.contentMode = UIViewContentModeScaleAspectFill;
    
    // 下边的这两句代码就是让头像可以随意拖动, 然后再回到原来的位置
    self.bgView.userInteractionEnabled = YES;
    [self.bgView makeDraggable];
    
}

@end
