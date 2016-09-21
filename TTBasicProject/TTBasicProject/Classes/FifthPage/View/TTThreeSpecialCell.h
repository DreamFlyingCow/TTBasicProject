//
//  TTThreeSpecialCell.h
//  UnicornSeller
//
//  Created by 赵春浩 on 16/9/6.
//  Copyright © 2016年 Unicorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTThreeSpecialCell : UITableViewCell
/**
 *  输入TF
 */
@property (nonatomic ,strong) UITextField *textField;
/**
 *  只是用来展示信息的Label
 */
@property (strong, nonatomic) UILabel *mesLabel;
/**
 *  这个是用来展示最左侧的标题的
 */
@property (strong, nonatomic) UILabel *titleLabel;

@end
