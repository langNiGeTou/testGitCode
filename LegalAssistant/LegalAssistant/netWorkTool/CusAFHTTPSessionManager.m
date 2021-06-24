//
//  ZTXAFHTTPSessionManager.m
//  MVC
//
//  Created by LangApple on 2017/11/11.
//  Copyright © 2017年 zhangTX. All rights reserved.
//

#import "CusAFHTTPSessionManager.h"

static NSString *const APIBaseURLString = @"";

@implementation CusAFHTTPSessionManager

+ (instancetype)shareInstance
{
    static CusAFHTTPSessionManager *ztxAFHTTPSessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ztxAFHTTPSessionManager = [[CusAFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:APIBaseURLString] ];
    });
    return ztxAFHTTPSessionManager;
}

#pragma mark - 重写initWithBaseURL
/**
 *@param url baseUrl
 *
 *@return 通过重写initWithBaseURL方法，返回网络请求类的实例
 */
- (instancetype)initWithBaseURL:(NSURL*)url
{
    if (self = [super initWithBaseURL:url]) {
        //设置请求超时时间
        self.requestSerializer.timeoutInterval = 10;
        //设置相应的缓存策略 数据需要从原始地址加载。不使用现有缓存
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        //分别设置请求以及相应的序列化器
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        self.responseSerializer = response;
        
        //复杂的参数类型 需要使用json传值-设置请求内容的类型
        [self.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        self.securityPolicy.allowInvalidCertificates = NO;
        //设置接受的类型
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", @"application/x-www-form-urlencoded;charset=utf-8",nil]];
        
    }
    return self;
}

@end
