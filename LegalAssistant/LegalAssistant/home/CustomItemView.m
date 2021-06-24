//
//  CustomHomeItemView.m
//  LegalAssistant
//
//  Created by lang on 2021/6/18.
//

#import "CustomItemView.h"

@interface CustomItemView ()



@end

@implementation CustomItemView
@synthesize itemBtn;

- (instancetype)initWithName:(NSString *)titleStr Image:(NSString *)imgStr
{
    self = [super init];
    if (self) {
        
//        UIControl *itemBgCtrl = [[UIControl alloc] init];
//        itemBgCtrl.userInteractionEnabled = YES;
//        itemBgCtrl.layer.borderColor = RGB(223, 225, 230).CGColor;
//        [self addSubview:itemBgCtrl];
//        [itemBgCtrl mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).with.offset(0);
//            make.right.equalTo(self).offset(0);
//            make.top.equalTo(self).offset(0);
//            make.bottom.equalTo(self).offset(0);
//            
////            make.width.mas_equalTo(56);
////            make.height.mas_equalTo(67);
//        }];
        
        
        itemBtn = [[UIButton alloc] init];
//        itemBtn.image = [UIImage imageNamed:self.imgNameStr];
        [itemBtn setBackgroundImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
        itemBtn.userInteractionEnabled = YES;
        [self addSubview:itemBtn];
        itemBtn.layer.borderColor = [UIColor clearColor].CGColor;
        [itemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(0);
            make.width.mas_equalTo(46);
            make.height.mas_equalTo(46);
        }];
        
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLab];
        NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:titleStr attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:14]}];
        titleLab.attributedText = titleString;
        titleLab.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(itemBtn.mas_bottom).offset(GCH(1));
            make.width.mas_equalTo(56);
            make.height.mas_equalTo(20);
        }];
        
        
        
    }
    return self;
}







@end
