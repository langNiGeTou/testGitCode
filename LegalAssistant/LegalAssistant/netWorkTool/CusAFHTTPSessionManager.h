//
//  ZTXAFHTTPSessionManager.h
//  MVC
//
//  Created by LangApple on 2017/11/11.
//  Copyright © 2017年 zhangTX. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

//请求方式
typedef NS_ENUM(NSUInteger,RequestMethod){
    POST = 0,
    GET,
    PUT,
    PATHCH,
    DELETE
};

//错误状态码 ios-sdk里面的NSURLError.h 文件
typedef NS_ENUM(NSInteger,AFNetworkErrorType){
    AFNetworkErrorType_Timeout = NSURLErrorTimedOut,                  //-1001 网络请求超时
    AFNetworkErrorType_UnURL = NSURLErrorUnsupportedURL,              //-1002 不支持url
    AFNetworkErrorType_NoNetWork = NSURLErrorNotConnectedToInternet,  //-1009 断网
    AFNetworkErrorType_404Fail = NSURLErrorBadServerResponse,         //-1011 404错误
    AFNetworkErrorType_3840Fail = 3840,                               //请求或返回不是纯json
};

@interface CusAFHTTPSessionManager : AFHTTPSessionManager
{
    
}

+ (instancetype)shareInstance;

@end
