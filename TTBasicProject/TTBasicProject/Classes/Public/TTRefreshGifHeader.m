//
//  TTRefreshGifHeader.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTRefreshGifHeader.h"

//static id _refreshInstance;
@interface TTRefreshGifHeader ()

//@property (copy, nonatomic) RefreshBlcok refreshBlock;

@end


@implementation TTRefreshGifHeader


//+ (instancetype)sharedRefreshGifHeaderWithRefreshBlock:(RefreshBlcok)refreshBlock {
//    
//    if (_refreshInstance == nil) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _refreshInstance = [TTRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//            
//            
//            NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"loading_3"], [UIImage imageNamed:@"loading_4"], [UIImage imageNamed:@"loading_5"], nil];
//            
//            [_refreshInstance setImages:@[[UIImage imageNamed:@"loading_1"]] forState:MJRefreshStateIdle];
//            
//            [_refreshInstance setImages:@[[UIImage imageNamed:@"loading_2"]] forState:MJRefreshStatePulling];
//            
//            [_refreshInstance setImages:images forState:MJRefreshStateRefreshing];
//        });
//    }
//    
//    ((TTRefreshGifHeader *)_refreshInstance).refreshBlock = refreshBlock;
//    return _refreshInstance;
//}


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


- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state {
    
    [super setImages:images duration:duration forState:state];
}
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state {
    
    [self setImages:images duration:images.count * 0.3 forState:state];
}

//- (void)loadNewData {
//    
//    NSLog(@"%s", __FUNCTION__);
//    if (self.refreshBlock) {
//        self.refreshBlock;
//    }
//    
//}



@end
