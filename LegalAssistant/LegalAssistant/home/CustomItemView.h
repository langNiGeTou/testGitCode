//
//  CustomHomeItemView.h
//  LegalAssistant
//
//  Created by lang on 2021/6/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomItemView : UIControl

@property (nonatomic, strong) UIButton *itemBtn;

- (instancetype)initWithName:(NSString *)titleStr Image:(NSString *)imgStr;
//@property (nonatomic ,copy) NSString *imgNameStr;

@end

NS_ASSUME_NONNULL_END
