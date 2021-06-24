//
//  NSNumber+GC.h
//  AutoAdapter
//
//  Created by lang on 2021/6/15.
//

#import <UIKit/UIKit.h>

// 布局 height top  bottom 时用
#define GCW(Num) [NSNumber GC_ScreenWidthAdaptationWithNumber:(Num)]

// 布局 width left right leading trailing时用
#define GCH(Num) [NSNumber GC_screenHeightAdaptaionWithNumber:(Num)]

@interface NSNumber (GC)
+ (CGFloat)GC_screenHeightAdaptaionWithNumber:(CGFloat)num;
+ (CGFloat)GC_ScreenWidthAdaptationWithNumber:(CGFloat)num;
@end
