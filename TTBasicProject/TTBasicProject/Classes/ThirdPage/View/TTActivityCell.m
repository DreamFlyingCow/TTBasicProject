//
//  TTActivityCell.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTActivityCell.h"

@interface TTActivityCell ()
/**
 *  日期Label
 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/**
 *  内容Label
 */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
/**
 *  活力值增幅Label
 */
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;

@end



@implementation TTActivityCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
