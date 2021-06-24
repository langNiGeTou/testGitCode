//
//  CusWebSocketManager.h
//  WebScoketTest
//
//  Created by lang on 2021/6/15.
//  Copyright © 2021 zhangTX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>
#define dispatch_main_async_safe(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

typedef NS_ENUM(NSUInteger,WebSocketConnectType){
    WebSocketDefault = 0, //初始状态,未连接
    WebSocketConnect,      //已连接
    WebSocketDisconnect    //连接后断开
};

@class CusWebSocketManager;
@protocol CusWebSocketManagerDelegate <NSObject>

- (void)webSocketManagerDidReceiveMessageWithString:(NSString *_Nullable)string;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CusWebSocketManager : NSObject

@property (nonatomic, strong) SRWebSocket *webSocket;
@property (nonatomic, weak) id<CusWebSocketManagerDelegate > delegate;
@property (nonatomic, assign) BOOL isConnect;  //是否连接
@property (nonatomic, assign) WebSocketConnectType connectType;

+ (instancetype)shared;
- (void)connectServer;//建立长连接
- (void)reConnectServer;//重新连接
- (void)RMWebSocketClose;//关闭长连接
- (void)sendDataToServer:(NSString *)dataStr;//发送数据给服务器

@end

NS_ASSUME_NONNULL_END
