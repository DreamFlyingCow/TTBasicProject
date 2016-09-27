//
//  TTRefreshBackGifFooter.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/19.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTRefreshBackGifFooter.h"

@implementation TTRefreshBackGifFooter

+ (instancetype)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    
    TTRefreshBackGifFooter *footer = [super footerWithRefreshingBlock:refreshingBlock];
    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"loading_3"], [UIImage imageNamed:@"loading_4"], [UIImage imageNamed:@"loading_5"], nil];
    // 设置下拉没有到临界点时的图片
    [footer setImages:@[[UIImage imageNamed:@"loading_1"]] forState:MJRefreshStateIdle];
    // 设置下拉超过临界点时的图片
    [footer setImages:@[[UIImage imageNamed:@"loading_2"]] forState:MJRefreshStatePulling];
    // 设置正在刷新时的图片
    [footer setImages:images forState:MJRefreshStateRefreshing];
    
    return footer;
}
    
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state {
    
    [self setImages:images duration:images.count * 0.3 forState:state];
}



@end
