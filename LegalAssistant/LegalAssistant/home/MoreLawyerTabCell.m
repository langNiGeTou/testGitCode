//
//  MoreLawyerTabCell.m
//  LegalAssistant
//
//  Created by lang on 2021/6/19.
//

#import "MoreLawyerTabCell.h"

@implementation MoreLawyerTabCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(16,366,4,16);
        lineView.layer.backgroundColor = [UIColor colorWithRed:71/255.0 green:117/255.0 blue:236/255.0 alpha:1.0].CGColor;
        lineView.layer.cornerRadius = 2;
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(16);
            make.top.equalTo(self).offset(29);
            make.width.mas_equalTo(4);
            make.height.mas_equalTo(16);
        }];

        UILabel *lawyerLab = [[UILabel alloc] init];
        lawyerLab.frame = CGRectMake(28,361,72,25);
        lawyerLab.numberOfLines = 0;
        [self.contentView addSubview:lawyerLab];
        NSMutableAttributedString *lawyerStr = [[NSMutableAttributedString alloc] initWithString:@"推荐律师"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 18],NSForegroundColorAttributeName: [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0]}];
        lawyerLab.attributedText = lawyerStr;
        [lawyerLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineView.mas_right).offset(8);
            make.top.equalTo(self).offset(24);
            make.width.mas_equalTo(72);
            make.height.mas_equalTo(25);
        }];
        
        
        UIButton *morelabel = [[UIButton alloc] init];
        [self.contentView addSubview:morelabel];
        NSMutableAttributedString *moreStr = [[NSMutableAttributedString alloc] initWithString:@"More" attributes: @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size: 12],NSForegroundColorAttributeName: RGB(179, 186, 197)}];
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        // 图片
        attch.image = [UIImage imageNamed:@"more"];
        // 设置图片大小
        attch.bounds = CGRectMake(0, -2, 11, 11);
        // 创建带有图片的富文本
        NSAttributedString *imgStr = [NSAttributedString attributedStringWithAttachment:attch];
        [moreStr appendAttributedString:imgStr]; //在文字后面添加图片
        [morelabel setAttributedTitle:moreStr forState:UIControlStateNormal];
        [morelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-16);
            make.top.equalTo(self).offset(28);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(14);
        }];
        [morelabel addTarget:self action:@selector(doMoreLawyer) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)doMoreLawyer{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableviewCell:flagBtnTitle:)]) {
        [self.delegate tableviewCell:self flagBtnTitle:@"more"];
    }
}

@end
