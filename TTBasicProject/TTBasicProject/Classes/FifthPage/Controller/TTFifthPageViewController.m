//
//  TTFifthPageViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTFifthPageViewController.h"
#import "TTRefreshGifHeader.h"
#import "TTThreeSpecialCell.h"
#import "TTCustomerHeaderView.h"
#import "TTActionSheet.h"

#define BottomViewHeight 44
#define PickViewHeight 216

static NSString *reuseIDArrowAndLabel = @"TTTextFieldCellArrow+Label";
static NSString *reuseIDTextField = @"TTTextFieldCellTextField";
static NSString *reuseIDLabel = @"TTTextFieldCellLabel";

@interface TTFifthPageViewController ()<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;
/**
 *  性别
 */
@property (strong, nonatomic) UIPickerView *pickerView;
/**
 *  日期
 */
@property (strong, nonatomic) UIDatePicker *datePicker;
/**
 *  头部视图
 */
@property (strong, nonatomic) TTCustomerHeaderView *headerView;
@end

@implementation TTFifthPageViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addTableView];
    [self addRightItem];
    [self initPickerView];
}

#pragma mark - 初始化tableView视图
- (void)addTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - BottomViewHeight - 64) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    _headerView = [[NSBundle mainBundle] loadNibNamed:@"TTCustomerHeaderView" owner:nil options:nil].lastObject;
    _headerView.layer.borderWidth = 0.5;
    _headerView.layer.borderColor = _tableView.separatorColor.CGColor;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickIconView:)];
    _headerView.iconView.userInteractionEnabled = YES;
    [_headerView.iconView addGestureRecognizer:tap];
    _tableView.tableHeaderView = _headerView;
    [self.view addSubview:_tableView];
    
    _tableView.mj_header = [TTRefreshGifHeader headerWithRefreshingBlock:^{
        
        NSLog(@"吃饭");
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            [_tableView.mj_header endRefreshing];
        });
    }];
}

#pragma mark - 初始化pickerView(性别与日期)视图
- (void)initPickerView {
    
    // 性别
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreenHeight - PickViewHeight - BottomViewHeight - 64, kScreenWidth, PickViewHeight)];
    _pickerView.backgroundColor =[UIColor whiteColor];
    _pickerView.showsSelectionIndicator = YES;
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [self.view addSubview:_pickerView];
    _pickerView.hidden = YES;
    
    // 日期
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, kScreenHeight - PickViewHeight - BottomViewHeight - 64, kScreenWidth, PickViewHeight)];
    // 设置背景色
    _datePicker.backgroundColor = [UIColor whiteColor];
    // 设置当前显示时间
    [_datePicker setDate:[NSDate date] animated:YES];
    // 设置UIDatePicker的显示模式
    [_datePicker setDatePickerMode:UIDatePickerModeDate];
    // 当值发生改变的时候调用的方法
    [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_datePicker];
    // 初始化之后隐藏
    _datePicker.hidden =YES;
    
}

#pragma mark - 添加navBar右侧的保存按钮
- (void)addRightItem {
    
    // 设置导航栏最右侧的按钮
    UIButton *saveBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    saveBtn.frame = CGRectMake(0, 0, 44, 44);
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    saveBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    saveBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    saveBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    [saveBtn addTarget:self action:@selector(didClickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 2;
    } else {
        return 5;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTThreeSpecialCell *cell;
    
    if (indexPath.section == 0 || (indexPath.section == 1 && indexPath.row == 3)) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIDArrowAndLabel];
        if (cell == nil) {
            cell = [[TTThreeSpecialCell alloc] initWithStyle:0 reuseIdentifier:reuseIDArrowAndLabel];
        }
    } else if ((indexPath.section == 1 && indexPath.row == 1) || (indexPath.section == 1 && indexPath.row == 2)) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIDLabel];
        if (cell == nil) {
            cell = [[TTThreeSpecialCell alloc] initWithStyle:0 reuseIdentifier:reuseIDLabel];
        }
    } else {
        cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIDTextField];
        if (cell == nil) {
            cell = [[TTThreeSpecialCell alloc] initWithStyle:0 reuseIdentifier:reuseIDTextField];
            cell.textField.delegate = self;
        }
    }
    cell.titleLabel.text = @"哈哈";
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 1) {
        return 6;
    }
    
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        TTThreeSpecialCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        CGFloat temp = kScreenHeight - cell.frame.origin.y - 44 - BottomViewHeight - 64;
        
        if (temp < PickViewHeight) {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - PickViewHeight - BottomViewHeight - 64);
            }];
            
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            
        }
        
        self.pickerView.hidden = NO;
        self.datePicker.hidden = YES;
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        
        TTThreeSpecialCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        CGFloat temp = kScreenHeight - cell.frame.origin.y - 44 - 64 - BottomViewHeight;
        
        if (temp < PickViewHeight) {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - PickViewHeight - BottomViewHeight - 64);
            }];
            
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        }
        
        self.pickerView.hidden = YES;
        self.datePicker.hidden = NO;
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - BottomViewHeight - 64);
        }];
        self.pickerView.hidden = YES;
        self.datePicker.hidden = YES;
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (!self.pickerView.hidden || !self.datePicker.hidden) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - BottomViewHeight);
        }];
        self.pickerView.hidden = YES;
        self.datePicker.hidden = YES;
        
        return NO;
    }
    return YES;
}

#pragma mark - dataPicker
- (void)datePickerValueChanged:(UIDatePicker *)data {
    
    NSDate *selectData = [data date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateAndTime = [dateFormatter stringFromDate:selectData];
    TTThreeSpecialCell *birthCell =[self.tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
    birthCell.mesLabel.text = dateAndTime;
    birthCell.mesLabel.textColor = [UIColor blackColor];
    
}

#pragma mark - pickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 2;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (row == 0) {
        
        return @"男";
    } else {
        
        return @"女";
    }
}

// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    TTThreeSpecialCell *sexCell = [self.tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    if (row == 0) {
        
        sexCell.mesLabel.text = @"男";
    } else {
        
        sexCell.mesLabel.text = @"女";
    }
    
    sexCell.mesLabel.textColor = [UIColor blackColor];
}

#pragma mark - 保存按钮的点击事件
- (void)didClickSaveBtn:(UIButton *)btn {
    
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - 换头像
- (void)didClickIconView:(UITapGestureRecognizer *)tap {
    
    
    [self.view endEditing:YES];
    if (!self.pickerView.hidden || !self.datePicker.hidden) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - BottomViewHeight);
        }];
        self.pickerView.hidden = YES;
        self.datePicker.hidden = YES;
    }
    TTActionSheet *actionSheet = [[TTActionSheet alloc] initWithTitles:[NSArray arrayWithObjects:@"从相册选择", @"拍照", @"取消", nil]];
    actionSheet.destructiveButtonIndex = -1;
    NSUInteger index = [actionSheet showInView:self.view];
    
    if (index == 0) {
        
        //初始化UIImagePickerController
        UIImagePickerController *pickerImageVC = [[UIImagePickerController alloc]init];
        // 获取方式1：通过相册（呈现全部相册) UIImagePickerControllerSourceTypePhotoLibrary
        // 获取方式2，通过相机              UIImagePickerControllerSourceTypeCamera
        // 获取方法3，通过相册（呈现全部图片）UIImagePickerControllerSourceTypeSavedPhotosAlbum
        pickerImageVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 允许编辑，即放大裁剪
        pickerImageVC.allowsEditing = YES;
        // 自代理
        pickerImageVC.delegate = self;
        // 页面跳转
        [self presentViewController:pickerImageVC animated:YES completion:nil];
    } else if (index == 1) {
        
        // 通过相机的方式
        UIImagePickerController *pickerImageVC = [[UIImagePickerController alloc] init];
        // 获取方式:通过相机
        pickerImageVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerImageVC.allowsEditing = YES;
        pickerImageVC.delegate = self;
        [self presentViewController:pickerImageVC animated:YES completion:nil];
    } else {
        // 添加一个这个空条件语句点击屏幕的空余部分actionSheet也会消失
    }
}

// PickerImage完成后的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //获取我们选择的图片
    UIImage *backPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    _headerView.iconView.image = backPhoto;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



@end