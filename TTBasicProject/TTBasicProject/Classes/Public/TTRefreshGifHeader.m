//
//  TTRefreshGifHeader.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTRefreshGifHeader.h"

@implementation TTRefreshGifHeader

+ (instancetype)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    
    TTRefreshGifHeader *header = [super headerWithRefreshingBlock:refreshingBlock];
    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"loading_3"], [UIImage imageNamed:@"loading_4"], [UIImage imageNamed:@"loading_5"], nil];
    // 设置下拉没有到临界点时的图片
    [header setImages:@[[UIImage imageNamed:@"loading_1"]] forState:MJRefreshStateIdle];
    // 设置下拉超过临界点时的图片
    [header setImages:@[[UIImage imageNamed:@"loading_2"]] forState:MJRefreshStatePulling];
    // 设置正在刷新时的图片
    [header setImages:images forState:MJRefreshStateRefreshing];
    
    return header;
}

- (void)setImages:(NSArray *)images forState:(MJRefreshState)state {
    
    [self setImages:images duration:images.count * 0.3 forState:state];
}



@end
