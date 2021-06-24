//
//  IMUIVC.m
//  LegalAssistant
//
//  Created by lang on 2021/6/15.
//

#import "IMUIVC.h"
#import "CusWebSocketManager.h"

@interface IMUIVC ()
@property (strong, nonatomic)  UITextField *sendFiled;

@property (strong, nonatomic)  UIButton *sendBtn;


@property (strong, nonatomic)  UIButton *connectBtn;

@property (strong, nonatomic)  UIButton *disConnectBtn;

@property (strong, nonatomic)  UIButton *pingBtn;
@end

@implementation IMUIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CusWebSocketManager shared];
    
    _connectBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 190, 80, 40)];
    [_connectBtn setTitle:@"连接" forState:UIControlStateNormal];
    _connectBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_connectBtn];
    [_connectBtn addTarget:self action:@selector(connectAction) forControlEvents:UIControlEventTouchUpInside];
    
    _disConnectBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 290, 80, 40)];
    [_disConnectBtn setTitle:@"断开连接" forState:UIControlStateNormal];
    _disConnectBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_disConnectBtn];
    [_disConnectBtn addTarget:self action:@selector(disConnectAction) forControlEvents:UIControlEventTouchUpInside];
    
    _sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 390, 80, 40)];
    [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    _sendBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_sendBtn];
    [_sendBtn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    
    _sendFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 490, 370, 40)];
    _sendFiled.layer.borderColor = [UIColor blackColor].CGColor;
    _sendFiled.layer.borderWidth = 1.0;
    [self.view addSubview:_sendFiled];
    
    
//    _connectBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 90, 80, 40)];
//    [_connectBtn setTitle:@"连接" forState:UIControlStateNormal];
//    _connectBtn.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_connectBtn];
//    [_pingBtn addTarget:self action:@selector(pingAction) forControlEvents:UIControlEventTouchUpInside];


    
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
