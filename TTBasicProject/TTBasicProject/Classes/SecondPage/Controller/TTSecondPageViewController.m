//
//  TTSecondPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTSecondPageViewController.h"
#import "UIView+Image.h"
#import "TTRefreshBackGifFooter.h"

@interface TTSecondPageViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArr;

@end

@implementation TTSecondPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
//    self.title = @"EmptyData";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 44 - 64) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    // 这里是设置空数据处理
    _tableView.emptyDataSetSource = self;
    _tableView.emptyDataSetDelegate = self;
    
    // 这句代码一定要加上去...........(是为了空数据页面)
    _tableView.tableFooterView = [[UIView alloc] init];
    
    // 设置数据源与代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    // 设置下拉刷新控件
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            [_tableView reloadData];
            [_tableView.mj_header endRefreshing];
        });
        
    }];
    
    // 设置上拉刷新控件(动画)
    _tableView.mj_footer = [TTRefreshBackGifFooter footerWithRefreshingBlock:^{
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            _dataArr = nil;
            [_tableView reloadData];
            [_tableView.mj_footer endRefreshing];
        });
    }];
    
    
//    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        
//        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
//        dispatch_after(time, dispatch_get_main_queue(), ^{
//            
//            _dataArr = nil;
//            [_tableView reloadData];
//            [_tableView.mj_footer endRefreshing];
//        });
//        
//    }];
    
    
}


#pragma mark - UITabelViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:nil];
    cell.textLabel.text = @"呵呵";
    
    return cell;
}





#pragma mark - 下边的这两个方法只是用来展示的, 不能进行用户交互(而且这时候页面是无法进行拖动刷新的)
//// 这个属性也是可以设置也可以不设置
//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
//    
//    return [UIImage imageNamed:@"404_customer"];
//}
//
// 这个属性可以设置也可以不设置
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSString *text = @"点击头像刷新, 有数据源的时候上拉移除数据源";
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f], NSForegroundColorAttributeName:[UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


#pragma mark - 下边的这两个方法要一个是添加按钮, 一个是处理点击事件(可以直接设置这两个方法, 点击图片就会进行刷新)
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    
    return [UIImage imageNamed:@"404_customer"];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    
    [_tableView.mj_header beginRefreshing];
//    [_tableView.mj_footer beginRefreshing];
    
    _dataArr = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [_tableView reloadData];
        [_tableView.mj_header endRefreshing];
//        [_tableView.mj_footer endRefreshing];
    });
    
    NSLog(@"哈哈");
}


#pragma mark - 此方法是为了处理再次刷新之后空数据页面因为刷新控件的原因而进行了偏移(不再居中了)
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView {
    
    scrollView.contentOffset = CGPointZero;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
