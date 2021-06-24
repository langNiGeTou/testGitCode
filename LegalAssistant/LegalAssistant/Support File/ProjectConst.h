//
//  ProjectConst.h
//  LegalAssistant
//
//  Created by lang on 2021/6/15.
//

#ifndef ProjectConst_h
#define ProjectConst_h

/*
 根据编译条件，Debug时输出日志，Release时关闭日志
 XCode LLVM XXX - Preprocessing中Debug会添加 DEBUG=1 标志
 */
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif

//#ifdef DEBUG
//#define NSLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
//#define debugMethod() NSLog(@"%s", __func__)
//#else
//#define NSLog(...)
//#define debugMethod()
//#endif

// weak refrence
#define WEAK_REF(obj)  __weak typeof(obj) weak##obj = obj;

//
//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]) && (![(_ref) isEqual:@"null"]) && (![(_ref) isEqual:@"(null)"]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqual:@"null"]) || ([(_ref) isEqual:@"(null)"]))

#define NotNilString(_ref)  (IsNilOrNull(_ref) ? @"" : _ref)


//
//系统版本判断
#define IOS12_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"12.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS11_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS9_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS8_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS7_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS6_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS5_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS4_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"4.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS3_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"3.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS_SYSTEM_VERSION    ( [[[UIDevice currentDevice] systemVersion] floatValue] )
#define IS_IPAD         ( UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad )

//app版本
#define AppVersion      ( [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] )



/*********************** UI Constant *******************************/

//导航栏高度
#define kNavigationBarH  (IOS7_OR_LATER ? 44 + [[UIApplication sharedApplication] statusBarFrame].size.height : 44)
//状态栏高度
#define kStatusBarH  [[UIApplication sharedApplication] statusBarFrame].size.height
//标签栏高度
//#define kTabBarH 49

// 屏幕宽度高度
#define kSCREEN_WIDTH                 [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT                [UIScreen mainScreen].bounds.size.height
#define kSCREEN_SCALE                 [UIScreen mainScreen].scale
// iPhoneX屏幕F
#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_Iphone_X (Is_Iphone && (kSCREEN_HEIGHT == 812.0 || kSCREEN_HEIGHT == 896.0))
#define NaviHeight (Is_Iphone_X ? 88 : 64)
#define kTabBarH (Is_Iphone_X ? 83 : 49)
#define BottomHeight (Is_Iphone_X ? 34 : 0)
//距左视图的距离
#define kHomeContentMarginLeft 10
// 屏幕大小
#define kIPHONE4_OR_5                 ([UIScreen mainScreen].bounds.size.width) == 320 ? YES : NO
#define kIPHONE6                      ([UIScreen mainScreen].bounds.size.width) == 375 ? YES : NO
#define kIPHONE6PLUS                  ([UIScreen mainScreen].bounds.size.width) == 414 ? YES : NO

// RGB颜色转换（16进制->10进制）
#define COLOR_FROM_RGB(rgbVal)      [UIColor colorWithRed:((float)((rgbVal & 0xFF0000) >> 16))/255.0 green:((float)((rgbVal & 0xFF00) >> 8))/255.0 blue:((float)(rgbVal & 0xFF))/255.0 alpha:1.0]
// RGB颜色
#define RGBA(r, g, b, a)              [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                  RGBA(r, g, b, 1.0f)


#endif /* ProjectConst_h */
