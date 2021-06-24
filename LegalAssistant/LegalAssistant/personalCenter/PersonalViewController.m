//
//  FourViewController.m
//  gitTest
//
//  Created by 17090416 on 2021/4/8.
//

#import "PersonalViewController.h"
#import "CusWebSocketManager.h"
#import "UIColor+extend.h"

@interface PersonalViewController ()
@property (strong, nonatomic)  UITextField *sendFiled;

@property (strong, nonatomic)  UIButton *sendBtn;


@property (strong, nonatomic)  UIButton *connectBtn;

@property (strong, nonatomic)  UIButton *disConnectBtn;

@property (strong, nonatomic)  UIButton *pingBtn;

@property (strong, nonatomic)  UIView *bottomBarView;
@end

@implementation PersonalViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"PingFangSC-Semibold" size:GCW(10)],NSFontAttributeName,[UIColor getColor:@"0065FF"],NSForegroundColorAttributeName,nil];
        [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
        self.tabBarItem.image = [UIImage imageNamed:@"personalCenter"] ;
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"selected_personalCenter"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        self.tabBarItem.title = @"个人中心";
        [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initBottomView];
    
    [CusWebSocketManager shared];
    
//    _connectBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 190, 80, 40)];
//    [_connectBtn setTitle:@"连接" forState:UIControlStateNormal];
//    _connectBtn.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_connectBtn];
//    [_connectBtn addTarget:self action:@selector(connectAction) forControlEvents:UIControlEventTouchUpInside];
//
//    _disConnectBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 290, 80, 40)];
//    [_disConnectBtn setTitle:@"断开连接" forState:UIControlStateNormal];
//    _disConnectBtn.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_disConnectBtn];
//    [_disConnectBtn addTarget:self action:@selector(disConnectAction) forControlEvents:UIControlEventTouchUpInside];
//
//    _sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 390, 80, 40)];
//    [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
//    _sendBtn.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_sendBtn];
//    [_sendBtn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
//
//    _sendFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 490, 370, 40)];
//    _sendFiled.layer.borderColor = [UIColor blackColor].CGColor;
//    _sendFiled.layer.borderWidth = 1.0;
//    [self.view addSubview:_sendFiled];
    
  
    
    //    _connectBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 90, 80, 40)];
    //    [_connectBtn setTitle:@"连接" forState:UIControlStateNormal];
    //    _connectBtn.backgroundColor = [UIColor blackColor];
    //    [self.view addSubview:_connectBtn];
    //    [_pingBtn addTarget:self action:@selector(pingAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}


-(void)initBottomView
{
    _bottomBarView = [[UIView alloc]initWithFrame:CGRectZero];
    _bottomBarView.backgroundColor = [UIColor yellowColor];
    _bottomBarView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_bottomBarView];
    
    [self.bottomBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(GCH(20));
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(400);
        make.bottom.equalTo(self.view).with.offset(-200);
    }];
    
    //    NSMutableArray *_bottomButtons = [[NSMutableArray alloc]init];
    //    for(int i = 0 ; i < 3 ; i++)
    //    {
    //        UIButton *button = [[UIButton alloc]initWithFrame: CGRectZero];
    //        button.backgroundColor = [UIColor redColor];
    //        button.translatesAutoresizingMaskIntoConstraints = NO;
    //        [_bottomButtons addObject:button];
    //        [_bottomBarView addSubview:button];
    //        [button mas_makeConstraints:^(MASConstraintMaker *make) {
    //            if (i == 0) {
    //                make.left.mas_equalTo(20);
    //            }else{
    //                UIButton *previousButton = _bottomButtons[i-1];
    //                make.left.equalTo(previousButton.mas_right).with.offset(20);
    //            }
    //            make.top.mas_equalTo(_bottomBarView.mas_top);
    //            make.width.equalTo(_bottomBarView.mas_width).with.multipliedBy(1.0f/3).offset(-20*4/3);
    //            make.height.equalTo(_bottomBarView.mas_height);
    //        }];
    //
    //    }
}

//连接
- (void)connectAction
{
    [[CusWebSocketManager shared] connectServer];
    
}
//断开连接
- (void)disConnectAction
{
    [[CusWebSocketManager shared] RMWebSocketClose];
}

//发送消息
- (void)sendAction
{
    if (_sendFiled.text.length == 0) {
        return;
    }
    [[CusWebSocketManager shared]sendDataToServer:_sendFiled.text];
}


- (void)pingAction
{
    //    [[CusWebSocketManager shared]ping];
    
}
@end
