//
//  TTAlertView.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTAlertView : UIAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(void (^)(TTAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;


@end
