//
//  NetWorkManager.h
//  MVC
//
//  Created by LangApple on 2017/11/6.
//  Copyright © 2017年 zhangTX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CusAFHTTPSessionManager.h"



//请求方式
typedef NS_ENUM(NSUInteger,HttpResquestTypes){
    HttpsRequestTypeGet = 0,
    HttpResquestTypePost = 1
};

typedef void(^SuccessCompleteBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void(^FailureCompleteBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);
@interface CusNetWorkManager : NSObject
{
    UIImageView *loadSpriteView;
    UIImageView *loadBackgroundView;
    UILabel *tipLabelView;
    UIImageView *maskView;
}

@property (nonatomic, strong) NSOperationQueue *_Nullable operationQueue;

+(nonnull CusNetWorkManager *)getInstance;


/**
 *  get请求(普通参数)
 *
 * @param urlString       get请求的链接
 * @param paraments       get请求的参数
 * @param successedBlock  get请求成功返回参数
 * @param failBlock       get请求失败返回参数
 *
 */
- (nullable NSURLSessionDataTask *)get:(nonnull NSString *)urlString
                             paraments:(nullable id)paraments
                             successed:(nullable SuccessCompleteBlock)successedBlock
                               failure:(nullable FailureCompleteBlock)failBlock;

/**
 *  post请求(普通参数)
 *
 * @param urlString       post请求的链接
 * @param paraments       post请求的参数
 * @param successedBlock  post请求成功返回参数
 * @param failBlock       post请求失败返回参数
 *
 */
- (nullable NSURLSessionDataTask *)post:(nonnull NSString *)urlString
                              paraments:(nullable id)paraments
                              successed:(nullable SuccessCompleteBlock)successedBlock
                                failure:(nullable FailureCompleteBlock)failBlock;
/**
 *  post请求(图片上传)
 *
 * @param urlString       post请求的链接
 * @param paraments       post请求的参数
 * @param img             post请求上传的图片
 * @param nameKey         post请求图片上传对应的Key
 * @param successedBlock  post请求成功返回参数
 * @param failBlock       post请求失败返回参数
 *
 */
- (nullable NSURLSessionDataTask *)post:(nonnull NSString *)urlString
                              paraments:(nullable id)paraments
                                  image:(nullable UIImage *)img
                         keyOfImageName:(nonnull NSString *)nameKey
                              successed:(nullable SuccessCompleteBlock)successedBlock
                                failure:(nullable FailureCompleteBlock)failBlock;

- (void)cancelAllOperationRequest;
@end
