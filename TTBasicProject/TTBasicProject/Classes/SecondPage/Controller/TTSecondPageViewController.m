//
//  TTSecondPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTSecondPageViewController.h"
#import "UIView+Image.h"

@interface TTSecondPageViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation TTSecondPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 44 - 64) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.emptyDataSetSource = self;
    _tableView.emptyDataSetDelegate = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:nil];
    
    return cell;
}






- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
    return [UIImage imageNamed:@"404_customer"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSString *text = @"这个页面无数据";
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f], NSForegroundColorAttributeName:[UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


#pragma mark - 下边的这两个方法要一个是添加按钮, 一个是处理点击事件
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    return [btn buttonImageFromColor:kRandomColor];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    
    [_tableView.mj_header beginRefreshing];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        
        [_tableView.mj_header endRefreshing];
    });
    
    
    NSLog(@"哈哈");
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
