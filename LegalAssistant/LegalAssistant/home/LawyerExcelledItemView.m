//
//  LawyerExcelledItemView.m
//  LegalAssistant
//
//  Created by lang on 2021/6/21.
//

#import "LawyerExcelledItemView.h"

@implementation LawyerExcelledItemView

- (void)reloadItemWithInformation:(NSArray *)titleArr
{
    NSMutableArray *viewArrs = [[NSMutableArray alloc]init];
    for (int i = 0; i < titleArr.count; i++) {
        UILabel *excellentLab = [[UILabel alloc] init];
        [self addSubview:excellentLab];
        NSMutableAttributedString *excellentStr = [[NSMutableAttributedString alloc] initWithString:titleArr[i] attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:13],NSForegroundColorAttributeName:RGB(0, 101, 255)}];
        excellentLab.layer.backgroundColor = [UIColor colorWithRed:228/255.0 green:239/255.0 blue:255/255.0 alpha:1.0].CGColor;
        excellentLab.attributedText = excellentStr;
        excellentLab.textAlignment = NSTextAlignmentCenter;
        excellentLab.layer.cornerRadius = 4;
        [viewArrs addObject:excellentLab];
        [excellentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(64);
            make.height.mas_equalTo(25);
        }];
    }
    [viewArrs mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:4.0 leadSpacing:0 tailSpacing:0];
    // 设置array的垂直方向的约束

}

@end
