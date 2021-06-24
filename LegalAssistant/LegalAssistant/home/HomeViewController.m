//
//  SecondViewController.m
//  gitTest
//
//  Created by 17090416 on 2021/4/8.
//

#import "HomeViewController.h"
#import "DetailTabVC.h"
#import "NormalTableViewCell.h"
#import "DeleBtnView.h"
#import "UIColor+extend.h"
#import "CustomItemView.h"
#import "HeaderTabCell.h"
#import "MoreLawyerTabCell.h"
#import "HomeTabDelegate.h"
#import <MJRefresh/MJRefresh.h>

#import "HotkeLoginVCViewController.h"
#import "ChooseIdentityVC.h"
#import "LoginViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,HomeTabDelegate>
@property (nonatomic ,strong) DeleBtnView *showbtnView;
@property (nonatomic,strong) UITableView *vTabView;
@end

@implementation HomeViewController
@synthesize vTabView;
- (instancetype)init{
    self = [super init];
    if (self) {
//        self.zx_hideBaseNavBar = YES;//隐藏导航栏
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"PingFangSC-Semibold" size:GCW(10)],NSFontAttributeName,[UIColor getColor:@"0065FF"],NSForegroundColorAttributeName,nil];
        [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
        self.tabBarItem.image = [UIImage imageNamed:@"home"] ;
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"selected_home"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        self.tabBarItem.title = @"首页";
        [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%f",kNavigationBarH);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor blackColor];
    vTabView = [[UITableView alloc]initWithFrame:CGRectZero];
    vTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    vTabView.dataSource = self;
    vTabView.delegate = self;
    [self.view addSubview:vTabView];
    
    [vTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kNavigationBarH);
        make.bottom.equalTo(self.view);
    }];
    vTabView.backgroundColor = RGB(244, 245, 247);
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction)];
    
    //是否隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
    //文字颜色
//    header.stateLabel.textColor = [UIColor redColor];
//    header.lastUpdatedTimeText = ^NSString * _Nonnull(NSDate * _Nullable lastUpdatedTime) {
//        return []@"更新时间";
//    };
    //普通状态的文字
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
//    //松开可以刷新
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
//    //正在刷新
    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    [header setTitle:@"刷新完成" forState:MJRefreshStateNoMoreData];
    vTabView.mj_header = header;
    MJRefreshBackGifFooter *footView = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(normalFooter)];
    vTabView.mj_footer = footView;
    
}

- (void)normalFooter
{
    sleep(1.5);
    //手动结束刷新状态
    [vTabView.mj_footer endRefreshing];
}

- (void)headerAction
{
    sleep(1.5);
    //手动结束刷新状态
    [vTabView.mj_header endRefreshing];
    //根据拖拽比例自动切换透明度
    vTabView.mj_header.automaticallyChangeAlpha = YES;
}

- (void)doReward{
    NSLog(@"doReward");
}

- (void)doLookForLawye{
    NSLog(@"doLookForLawye");
}

- (void)doContract{
    NSLog(@"doContract");
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 251;
    }else if (indexPath.row == 1) {
        return 57;
    }else{
        return 156;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoginViewController *detailVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
//    ChooseIdentityVC *detailVC = [[ChooseIdentityVC alloc] init];
//    [self.navigationController pushViewController:detailVC animated:YES];
    
//    DetailTabVC *detailVC = [[DetailTabVC alloc] init];
//    detailVC.title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
//    [self.navigationController pushViewController:detailVC animated:YES];
    
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        HeaderTabCell *cTabCell = [tableView dequeueReusableCellWithIdentifier:@"idOne"];
        if (!cTabCell) {
            cTabCell = [[HeaderTabCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idOne"];
            cTabCell.delegate = self;
        }
//        [cTabCell layoutTableViewCell];
        cTabCell.selectionStyle = UITableViewCellSelectionStyleNone;
        cTabCell.backgroundColor = RGB(244, 245, 247);
        return cTabCell;
    }else if (indexPath.row == 1){
        MoreLawyerTabCell *cTabCell = [tableView dequeueReusableCellWithIdentifier:@"idTwo"];
        if (!cTabCell) {
            cTabCell = [[MoreLawyerTabCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idTwo"];
            cTabCell.delegate = self;
        }
//        [cTabCell layoutTableViewCell];
        cTabCell.selectionStyle = UITableViewCellSelectionStyleNone;
        cTabCell.backgroundColor = RGB(244, 245, 247);
        return cTabCell;
    }else {
        NormalTableViewCell *cTabCell = [tableView dequeueReusableCellWithIdentifier:@"idThree"];
        if (!cTabCell) {
            cTabCell = [[NormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idThree"];
            cTabCell.delegate = self;
        }
        [cTabCell layoutTableViewCell];
        cTabCell.selectionStyle = UITableViewCellSelectionStyleNone;
        cTabCell.backgroundColor = RGB(244, 245, 247);
        return cTabCell;
    }
}


#pragma mark - HomeTabDelegate
- (void)tableviewCell:(UITableViewCell *)tableviewcell flagBtnTitle:(NSString *)flagStr
{
    NSLog(@"more");
}
#pragma mark - NormalTableViewCellDelegate
- (void)tableviewCell:(UITableViewCell *)tableviewcell delebtn:(UIButton *)btn
{
    _showbtnView = [[DeleBtnView alloc]initWithFrame:self.view.bounds];
    _showbtnView.frame = self.view.bounds;
    /*
     1使用convertPoint:toView:时，调用者应为covertPoint的父视图。即调用者应为point的父控件。toView即为需要转换到的视图坐标系，以此视图的左上角为（0，0）点。
     2.使用convertPoint:fromView:时正好相反，调用者为需要转换到的视图坐标系。fromView为point所在的父控件。
     3.toView可以为nil。此时相当于toView传入self.view.window*/
    NSLog(@"btn.frame.origin:%@",NSStringFromCGPoint(btn.frame.origin));
    CGPoint point = [tableviewcell convertPoint:btn.frame.origin toView:nil];
    NSLog(@"point:%@",NSStringFromCGPoint(point));
    [_showbtnView showMyBtnWithPoint:point showBtnBlock:^{ //本地block
        NSLog(@"NormalTableViewCellDelegate");
    }];
}

@end
