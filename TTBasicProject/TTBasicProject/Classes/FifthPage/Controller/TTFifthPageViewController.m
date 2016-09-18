//
//  TTFifthPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTFifthPageViewController.h"
#import "TTRefreshGifHeader.h"

@interface TTFifthPageViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation TTFifthPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 44 - 64) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.mj_header = [TTRefreshGifHeader headerWithRefreshingBlock:^{
        
        NSLog(@"吃饭");
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            [_tableView.mj_header endRefreshing];
        });
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:nil];
    
    cell.textLabel.text = @"哈哈";
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



@end