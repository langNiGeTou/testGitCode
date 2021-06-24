//
//  NSNumber+GC.m
//  AutoAdapter
//
//  Created by lang on 2021/6/15.
//

#import "NSNumber+GC.h"

static CGFloat const iPhone4H = 480.0;

static CGFloat const iPhone5W = 320.0;
static CGFloat const iPhone5H = 568.0;

static CGFloat const iPhone6W = 375.0;
static CGFloat const iPhone6H = 667.0;//iPhoneSE2

static CGFloat const iPhone6PW = 414.0;//iPhone11ProMaxW
static CGFloat const iPhone6PH = 736.0;

static CGFloat const iPhoneXW = 375.0;
static CGFloat const iPhoneXH = 812.0;//iPhone11ProMax,iphoneXS,PhoneX

static CGFloat const iPhone11ProMaxH = 896.0;//iPhone11,iPhone11ProMax,iphoneXSMax,iphoneXR,

static CGFloat const iPhone12MiniW = 360.0;
static CGFloat const iPhone12MiniH = 780.0;

static CGFloat const iPhone12W = 390.0;
static CGFloat const iPhone12H = 844.0;

static CGFloat const iPhone12ProMaxW = 428.0;
static CGFloat const iPhone12ProMaxH = 926.0;

#define iPhone4         ([UIScreen mainScreen].bounds.size.height==480 ? YES : NO)
#define iPhone5         ([UIScreen mainScreen].bounds.size.height==568 ? YES : NO)
#define iPhone6         ([UIScreen mainScreen].bounds.size.height==667 ? YES : NO)
#define iPhone6P        ([UIScreen mainScreen].bounds.size.height==736 ? YES : NO)
#define iPhoneX         ([UIScreen mainScreen].bounds.size.height==812 ? YES : NO)
#define iPhone11ProMax  ([UIScreen mainScreen].bounds.size.height==896 ? YES : NO)
#define iPhone12Mini    ([UIScreen mainScreen].bounds.size.height==780 ? YES : NO)
#define iPhone12        ([UIScreen mainScreen].bounds.size.height==844 ? YES : NO)
#define iPhone12ProMax  ([UIScreen mainScreen].bounds.size.height==926 ? YES : NO)

// 默认以iPhoneX 为参照比例  据体根据UI 设计图来修改
static CGFloat const referenceW = iPhoneXW;
static CGFloat const referenceH = iPhoneXH;
@implementation NSNumber (GC)

// 以高度进行适配
+ (CGFloat)GC_screenHeightAdaptaionWithNumber:(CGFloat)num{
    NSNumber *orgNum = [NSNumber numberWithDouble:num];
    CGFloat AdaNum = [orgNum doubleValue];
    
    if (iPhone4) {
        AdaNum = iPhone4H / referenceH * AdaNum;
    }else if (iPhone5){
        AdaNum = iPhone5H / referenceH * AdaNum;
    }else if (iPhone6){
        AdaNum = iPhone6H / referenceH * AdaNum;
    }else if (iPhone6P){
        AdaNum = iPhone6PH / referenceH * AdaNum;
    }else if (iPhoneX){
        AdaNum = iPhoneXH / referenceH * AdaNum;
    }else if (iPhone11ProMax){
        AdaNum = iPhone11ProMaxH / referenceH * AdaNum;
    }else if (iPhone12Mini){
        AdaNum = iPhone12MiniH / referenceH * AdaNum;
    }else if (iPhone12){
        AdaNum = iPhone12H / referenceH * AdaNum;
    }else if (iPhone12ProMax){
        AdaNum = iPhone12ProMaxH / referenceH * AdaNum;
    }
    
    return AdaNum;
}

// 以宽度进行适配
+ (CGFloat)GC_ScreenWidthAdaptationWithNumber:(CGFloat)num{
    
    NSNumber *orgNum = [NSNumber numberWithDouble:num];
    CGFloat AdaNum = [orgNum doubleValue];
    
    if (iPhone5 || iPhone4) {
        AdaNum = iPhone5W / referenceW * AdaNum;
    }else if (iPhone6 || iPhoneX){
        AdaNum = iPhone6W / referenceW * AdaNum;
    }else if (iPhone6P || iPhone11ProMax){
        AdaNum = iPhone6PW / referenceW * AdaNum;
    }else if (iPhone12Mini){
        AdaNum = iPhone12MiniW / referenceW * AdaNum;
    }else if (iPhone12){
        AdaNum = iPhone12W / referenceW * AdaNum;
    }else if (iPhone12ProMax){
        AdaNum = iPhone12ProMaxW / referenceW * AdaNum;
    }
    return AdaNum;
}
@end
