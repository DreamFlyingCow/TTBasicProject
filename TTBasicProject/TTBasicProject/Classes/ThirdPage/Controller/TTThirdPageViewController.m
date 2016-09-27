//
//  TTThirdPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTThirdPageViewController.h"
#import "TTActivityCell.h"
#import <UITableView+FDTemplateLayoutCell.h>

static NSString *reuseID = @"TTActivityCell";
@interface TTThirdPageViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation TTThirdPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 44 - 64) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"TTActivityCell" bundle:nil] forCellReuseIdentifier:reuseID];
    
    // 设置MJGif系统动画刷新
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    NSArray *images = [NSArray arrayWithObjects:[UIImage  imageNamed:@"loading_3"], [UIImage  imageNamed:@"loading_4"], [UIImage  imageNamed:@"loading_5"], nil];
    [header setImages:@[[UIImage  imageNamed:@"loading_1"]] forState:MJRefreshStateIdle];
    [header setImages:@[[UIImage  imageNamed:@"loading_2"]] forState:MJRefreshStatePulling];
    [header setImages:images forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_header = header;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    // 在这里处理数据源
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 自动计算行高(注意xib的布局)
    return [tableView fd_heightForCellWithIdentifier:reuseID configuration:^(id cell) {
        // 在这里处理数据源
    }];
}

// 模拟数据加载
- (void)loadNewData {
    
    NSLog(@"呵呵");
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        
        [_tableView.mj_header endRefreshing];
    });
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



@end
