//
//  NetWorkManager.m
//  MVC
//
//  Created by LangApple on 2017/11/6.
//  Copyright © 2017年 zhangTX. All rights reserved.
//

#import "CusNetWorkManager.h"
@interface CusNetWorkManager ()
{
    
}
@end
static CusNetWorkManager *networkManager;
static CusAFHTTPSessionManager *afHTTPSessionManager;

@implementation CusNetWorkManager
@synthesize operationQueue;
//实例化
+ (CusNetWorkManager *)getInstance
{
    @synchronized(self)
    {
        if (!networkManager) {
            networkManager = [[self alloc] init];
            networkManager.operationQueue = [[NSOperationQueue alloc] init];
            afHTTPSessionManager = [CusAFHTTPSessionManager shareInstance];
        }
    }
    return networkManager;
}


#pragma mark -  get请求(普通参数)
- (nullable NSURLSessionDataTask *)get:(nonnull NSString *)urlString
                             paraments:(nullable id)paraments
                             successed:(nullable SuccessCompleteBlock)successedBlock
                               failure:(nullable FailureCompleteBlock)failBlock
{
    afHTTPSessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];//请求
    afHTTPSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    afHTTPSessionManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    afHTTPSessionManager.requestSerializer.timeoutInterval = 10.f;
    NSURLSessionDataTask *task =  [afHTTPSessionManager GET:urlString
                                                 parameters:paraments
                                                    headers:nil
                                                   progress:^(NSProgress * _Nonnull downloadProgress) {}
                                                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                        successedBlock(task,responseObject);
                                                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                        failBlock(task,error);}];
    
    return task;
}

#pragma mark - post请求(普通参数)
- (nullable NSURLSessionDataTask *)post:(nonnull NSString *)urlString
                              paraments:(nullable id)paraments
                              successed:(nullable SuccessCompleteBlock)successedBlock
                                failure:(nullable FailureCompleteBlock)failBlock
{
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误
    afHTTPSessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];//请求
    afHTTPSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    afHTTPSessionManager.requestSerializer.timeoutInterval = 10.f;
    //    [afHTTPSessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        
    //    [afHTTPSessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    NSURLSessionDataTask *task =[afHTTPSessionManager POST:urlString
                                                parameters:paraments
                                                   headers:nil
                                                  progress:^(NSProgress * _Nonnull uploadProgress) {}
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                       successedBlock(task,responseObject);// 请求成功，解析数据
                                                   }
                                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                       failBlock(task,error);// 请求失败
                                                   }];
    // post请求
    return task;
}


#pragma mark - post请求(图片上传)
- (nullable NSURLSessionDataTask *)post:(nonnull NSString *)urlString
                              paraments:(nullable id)paraments
                                  image:(nullable UIImage *)img
                         keyOfImageName:(nonnull NSString *)nameKey
                              successed:(nullable SuccessCompleteBlock)successedBlock
                                failure:(nullable FailureCompleteBlock)failBlock
{
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误
    afHTTPSessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];//请求
    afHTTPSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    
    [afHTTPSessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    afHTTPSessionManager.requestSerializer.timeoutInterval = 5.0f;
    [afHTTPSessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //判断name的是否为空
    
    NSURLSessionDataTask *task =[afHTTPSessionManager POST:urlString
                                                parameters:paraments
                                                   headers:nil
                                 constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                                     NSData *data = UIImageJPEGRepresentation(img,0.5);
                                     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                                     formatter.dateFormat = @"yyyyMMssHHmmssSSS";
                                     NSString *timeStr = [formatter stringFromDate:[NSDate date]];
                                     NSString *fileName = [NSString stringWithFormat:@"%@.jpg", timeStr];
                                     [formData appendPartWithFileData:data name:nameKey fileName:fileName mimeType:@"image/png"];
                                 }
                                                  progress:^(NSProgress * _Nonnull uploadProgress){}
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                       // 请求成功，解析数据
                                                       successedBlock(task,responseObject);
                                                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                       // 请求失败
                                                       failBlock(task,error);
                                                   }];
    // post请求
    return task;
}

#pragma mark - 取消所有的网络请求
- (void)cancelAllOperationRequest
{
    [afHTTPSessionManager.operationQueue cancelAllOperations];
    [networkManager.operationQueue cancelAllOperations];
}

//- (void)cancelOperation:(AFHTTPRequestSerializer *)opertation {
//    if (opertation == nil) {
//        return ;
//    }
//    [opertation cancel];
//    opertation = nil;
//    [self removeLoadView];
//}


#pragma mark - 取消指定的url请求
/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的完整url
 */

- (void)cancelHttpRequestWithRequestType:(NSString *)requestType
                        requestUrlString:(NSString *)string
{
    NSError * error;
    /**根据请求的类型 以及 请求的url创建一个NSMutableURLRequest---通过该url去匹配请求队列中是否有该url,如果有的话 那么就取消该请求*/
    NSString * urlToPeCanced = [[[afHTTPSessionManager.requestSerializer
                                  requestWithMethod:requestType URLString:string parameters:nil error:&error] URL] path];
    
    for (NSOperation * operation in afHTTPSessionManager.operationQueue.operations) {
        //如果是请求队列
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            //请求的类型匹配
            BOOL hasMatchRequestType = [requestType isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            //请求的url匹配
            BOOL hasMatchRequestUrlString = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            //两项都匹配的话  取消该请求
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                [operation cancel];
            }
        }
    }
}

-(void) dealloc {
    if (operationQueue) {
        [operationQueue cancelAllOperations];
    }
}

@end
