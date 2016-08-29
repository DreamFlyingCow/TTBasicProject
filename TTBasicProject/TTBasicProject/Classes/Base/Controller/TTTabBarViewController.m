//
//  TTTabBarViewController.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/8/29.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTTabBarViewController.h"

@interface TTTabBarViewController ()

@end

@implementation TTTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //初始化子视图
    [self _initWithControllers];
    //创建自定义TabBar
    [self _initTabBarViewController];
    self.tabBar.backgroundColor = [UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1.0f];
    
}

- (void)_initWithControllers {
    
    _firstVC = [[TTFirstPageViewController alloc]init];
    _secondVC = [[TTSecondPageViewController alloc]init];
    _thirdVC = [[TTThirdPageViewController alloc] init];
    _forthVC = [[TTForthPageViewController alloc]init];
    

    
    self.firstNav = [[BaseNavigationController alloc]initWithRootViewController:_firstVC];
    self.secondNav = [[BaseNavigationController alloc]initWithRootViewController:_secondVC];
    self.thirdNav = [[BaseNavigationController alloc]initWithRootViewController:_thirdVC];
    self.forthNav = [[BaseNavigationController alloc]initWithRootViewController:_forthVC];
    
    NSArray *navs = [NSArray arrayWithObjects:self.firstVC, self.secondVC, self.thirdVC, self.forthVC, nil];
    self.viewControllers = navs;
}


-(void)_initTabBarViewController {
    
//    TabBarItem的title
    NSArray *title = @[@"",@"",@"",@""];
    //TabBar上Button在Normal状态下的图片
    NSArray *tabBarImage = @[@"home",@"guke",@"kitty",@"message"];
    //TabBar上Button在Selected状态下的图片
    NSArray *tabBarPress = @[@"homeH",@"gukeH",@"kittyH",@"messageH"];
    self.btnArray = [NSMutableArray array];
    //创建TabBar上的Button和Label
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.tabBar.frame.size.height)];
    bgImgView.userInteractionEnabled = YES;
    bgImgView.backgroundColor = [UIColor clearColor];
    [self.tabBar addSubview:bgImgView];
    for (int i = 0; i<[title count]; i++) {
        
        UIButton *tabBtn;
        tabBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBtn.backgroundColor = [UIColor clearColor];
        //默认选中状态为NO
        tabBtn.selected = NO;
        //设置Button的frame
        CGRect rect;
        rect.origin.x = (kScreenWidth/[title count])*i;
        rect.origin.y = 0;
        rect.size.width = kScreenWidth/[title count];
        rect.size.height = self.tabBar.frame.size.height;
        tabBtn.frame = rect;
        
        tabBtn.center = CGPointMake(32 + (rect.size.width)*i, self.tabBar.frame.size.height / 2);
        tabBtn.tag = i + 100;
        
        tabBtn.frame = rect;
        tabBtn.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        tabBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        //        tabBtn.userInteractionEnabled = YES;
        
        //设置图片
        [tabBtn setImage:[UIImage imageNamed:tabBarImage[i]]
                forState:UIControlStateNormal];
        [tabBtn setImage:[UIImage imageNamed:tabBarPress[i]] forState:UIControlStateHighlighted];
        [tabBtn setImage:[UIImage imageNamed:tabBarPress[i]]
                forState:UIControlStateSelected];
        //设置标题
        [tabBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        
        NSString *titleStr = title[i];
        [tabBtn setTitle:titleStr
                forState:UIControlStateNormal];
        [tabBtn setTitle:titleStr
                forState:UIControlStateSelected];
        [tabBtn setAdjustsImageWhenDisabled:NO];
        [tabBtn setAdjustsImageWhenHighlighted:NO];
        //设置触发事件
        [tabBtn addTarget:self action:@selector(SelectedTabBarIndex:) forControlEvents: UIControlEventTouchUpInside];
        //将btn添加到数组
        [self.btnArray addObject:tabBtn];
        [bgImgView addSubview:tabBtn];        
        if (i == 3) {
            
            if (!_msgMarkLab) {
                
                _msgMarkLab = [[UILabel alloc] initWithFrame:CGRectMake(tabBtn.width/2 - 5, 2, 17, 17)];
                _msgMarkLab.backgroundColor = kCustomColor(255, 127, 124);
                _msgMarkLab.layer.cornerRadius = _msgMarkLab.width/2;
                _msgMarkLab.textColor = [UIColor whiteColor];
                _msgMarkLab.font = [UIFont systemFontOfSize:11];
                _msgMarkLab.textAlignment = NSTextAlignmentCenter;
                _msgMarkLab.clipsToBounds  = YES;
                _msgMarkLab.hidden = YES;
                [tabBtn addSubview:_msgMarkLab];
            }
        }
    }
    UIButton *homeBtn = (self.btnArray)[0];
    
    homeBtn.selected = YES;
    homeBtn.userInteractionEnabled = NO;
}

//按钮选中事件
- (void)SelectedTabBarIndex:(UIButton*)button {
    
    self.selectedIndex = button.tag-100;
    [self.btnArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
         UIButton *btn = (UIButton *)obj;
         
         if (idx == self.selectedIndex) {
             
             btn.selected = YES;
             btn.userInteractionEnabled = NO;
         } else {
             
             btn.selected = NO;
             btn.userInteractionEnabled = YES;
         }
     }];
}

- (void)SelectedIndex:(NSUInteger)selectedIndex {
    
    if ([self isKindOfClass:[UITabBarController class]]) {
        
        [super setSelectedIndex:selectedIndex];
    }
    [self SelectedTabBarIndex:[self.btnArray objectAtIndex:selectedIndex]];
}

///刷新tabbar未读消息数
+ (void)refreshTabbarCount {
    
//    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [[SMDataBase shareDataBase] selectAllUnreadMsgCount:^(NSInteger unreadCount) {
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSString *unreadMsgCount = [NSString stringWithFormat:@"%ld",unreadCount];
//            if (unreadCount<=0)
//            {
//                app.cusTabbar.msgMarkLab.hidden = YES;
//            }
//            else
//            {
//                app.cusTabbar.msgMarkLab.hidden = NO;
//            }
//            if ([unreadMsgCount integerValue]>99)
//            {
//                app.cusTabbar.msgMarkLab.frame = CGRectMake(kScreenWidth/4/2 - 5, 2, 25, 17);
//                app.cusTabbar.msgMarkLab.text = @"99+";
//            }
//            else
//            {
//                app.cusTabbar.msgMarkLab.frame = CGRectMake(kScreenWidth/4/2 - 5, 2, 17, 17);
//                app.cusTabbar.msgMarkLab.text = unreadMsgCount;
//            }
//        });
//        
//    }];
    
}



@end
