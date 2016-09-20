//
//  TTThirdPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTThirdPageViewController.h"

@interface TTThirdPageViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation TTThirdPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
//    self.title = @"SystemRefresh";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 44 - 64) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//        NSLog(@"11111");
//    }];
    
    
    NSArray *images = [NSArray arrayWithObjects:[UIImage  imageNamed:@"loading_3"], [UIImage  imageNamed:@"loading_4"], [UIImage  imageNamed:@"loading_5"], nil];
    
    [header setImages:@[[UIImage  imageNamed:@"loading_1"]] forState:MJRefreshStateIdle];
    
    [header setImages:@[[UIImage  imageNamed:@"loading_2"]] forState:MJRefreshStatePulling];
    
    [header setImages:images forState:MJRefreshStateRefreshing];
    
    
    self.tableView.mj_header = header;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:nil];
    
    cell.textLabel.text = @"哈哈";
    
    return cell;
}


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
