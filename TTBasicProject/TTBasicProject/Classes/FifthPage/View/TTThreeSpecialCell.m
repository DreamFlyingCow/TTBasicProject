//
//  TTThreeSpecialCell.m
//  UnicornSeller
//
//  Created by 赵春浩 on 16/9/6.
//  Copyright © 2016年 Unicorn. All rights reserved.
//

#import "TTThreeSpecialCell.h"

@interface TTThreeSpecialCell ()
/**
 *  箭头视图
 */
@property (strong, nonatomic) UIImageView *arrowView;

@end



@implementation TTThreeSpecialCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 初始化方法
        [self setting:reuseIdentifier];
    }
    
    return self;
}

/**
 *  初始化三种Cell
 *
 *  @param reuseIdentifier 根据重用标识, 来创建三种不同的cell(之后根据重用标识去取)
 */
- (void)setting:(NSString *)reuseIdentifier {
    
    // 设置最左边的标题Label
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.centerY.equalTo(self.contentView);
        
    }];
    
    if ([reuseIdentifier isEqualToString:@"TTTextFieldCellArrow+Label"]) {
        // label + arrow
        self.arrowView = [[UIImageView alloc] init];
        self.arrowView.image = [UIImage imageNamed:@"btn_next"];
        [self.contentView addSubview:self.arrowView];
        [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.contentView.mas_right).with.offset(-6);
            make.centerY.equalTo(self.contentView);
            make.width.height.equalTo(@20);
        }];
        
        self.mesLabel = [[UILabel alloc] init];
        self.mesLabel.font = [UIFont systemFontOfSize:14];
        self.mesLabel.text = @"这里到底是啥";
        self.mesLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.mesLabel];
        [self.mesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.arrowView.mas_left).with.offset(-8);
            make.left.equalTo(self.titleLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.contentView);
        }];
    }
    
    if ([reuseIdentifier isEqualToString:@"TTTextFieldCellTextField"]) {
        // textField
        self.textField =[[UITextField alloc] init];
        self.textField.borderStyle = UITextBorderStyleNone;
        self.textField.textAlignment = NSTextAlignmentRight;
        self.textField.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.left.equalTo(self.titleLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.contentView);
        }];
    }
    
    if ([reuseIdentifier isEqualToString:@"TTTextFieldCellLabel"]) {
        // label
        self.mesLabel = [[UILabel alloc] init];
        self.mesLabel.font = [UIFont systemFontOfSize:14];
        self.mesLabel.textAlignment = NSTextAlignmentRight;
        self.mesLabel.text = @"这里到底是啥";
        [self.contentView addSubview:self.mesLabel];
        [self.mesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.left.equalTo(self.titleLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.contentView);
        }];
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
