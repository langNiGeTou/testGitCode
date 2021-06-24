//
//  MyTableViewCell.m
//  gitTest
//
//  Created by 17090416 on 2021/4/11.
//

#import "NormalTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "LawyerExcelledItemView.h"
@interface NormalTableViewCell ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *sourceLab;
@property (nonatomic, strong) UILabel *commentLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UIImageView *customImgV;
@property (nonatomic, strong) UIButton *deleteBtn;


@end

@implementation NormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *bgView = [[UIView alloc] init];
        bgView.layer.backgroundColor = [UIColor whiteColor].CGColor;
        bgView.layer.cornerRadius = 10;
        [self.contentView addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(16);
            make.right.equalTo(self.contentView).offset(-16);
            make.top.equalTo(self.contentView).offset(0);
            make.bottom.equalTo(self.contentView).offset(-8);
        }];
        
        UIImageView *titleImgView = [[UIImageView alloc] init];
        [titleImgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"optimization"]];
        [bgView addSubview:titleImgView];
        [titleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(GCW(8));
            make.top.equalTo(bgView).offset(0);
            make.width.mas_equalTo(32);
            make.height.mas_equalTo(19);
        }];
        
        UIImageView *chatView = [[UIImageView alloc] init];
        [chatView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"home_detail_info"]];
        [bgView addSubview:chatView];
        [chatView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgView).offset(GCW(-12));
            make.top.equalTo(bgView).offset(26);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        
        
        UIImageView *photoImgView = [[UIImageView alloc] init];
        [photoImgView sd_setImageWithURL:[NSURL URLWithString:@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fblog%2F201306%2F25%2F20130625150506_fiJ2r.jpeg&refer=http%3A%2F%2Fcdn.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626688168&t=52c34f529e1877f4ef9c850da3c22391"] placeholderImage:[UIImage imageNamed:@"man"]];
        [bgView addSubview:photoImgView];
        photoImgView.layer.cornerRadius = 10;
        [photoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(GCW(32));
            make.top.equalTo(bgView).offset(26);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(70);
        }];
        
        
        UIImageView *starImgView = [[UIImageView alloc] init];
        [starImgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"star"]];
        [bgView addSubview:starImgView];
        [starImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(GCW(51));
            make.top.equalTo(photoImgView.mas_bottom).offset(10);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(10);
        }];
        
        UILabel *starLab = [[UILabel alloc] init];
        [bgView addSubview:starLab];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"4.8"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:149/255.0 green:155/255.0 blue:164/255.0 alpha:1.0]}];
        starLab.attributedText = string;
        [starLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(starImgView.mas_right).offset(GCW(4));
            make.top.equalTo(photoImgView.mas_bottom).offset(7);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(17);
        }];
        
        UILabel *nameLab = [[UILabel alloc] init];
        [bgView addSubview:nameLab];
        NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:@"黄轩律师" attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 16],NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
        nameLab.attributedText = nameStr;
        [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(photoImgView.mas_right).offset(GCW(18));
            make.top.equalTo(bgView).offset(26);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(22);
        }];
        
        UILabel *workPlaceLab = [[UILabel alloc] init];
        [bgView addSubview:workPlaceLab];
        NSMutableAttributedString *workPlaceStr = [[NSMutableAttributedString alloc] initWithString:@"南京京诚同达律师事务所" attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:149/255.0 green:155/255.0 blue:164/255.0 alpha:1.0]}];
        workPlaceLab.attributedText = workPlaceStr;
        [workPlaceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(photoImgView.mas_right).offset(GCW(18));
            make.top.equalTo(nameLab.mas_bottom).offset(5);
            make.width.mas_equalTo(152);
            make.height.mas_equalTo(19);
        }];
        
        UILabel *workYearLab = [[UILabel alloc] init];
        [bgView addSubview:workYearLab];
        NSMutableAttributedString *workYearStr = [[NSMutableAttributedString alloc] initWithString:@"从业年限：15年" attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:13],NSForegroundColorAttributeName: [UIColor colorWithRed:149/255.0 green:155/255.0 blue:164/255.0 alpha:1.0]}];
        workYearLab.attributedText = workYearStr;
        [workYearLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(photoImgView.mas_right).offset(GCW(18));
            make.top.equalTo(workPlaceLab.mas_bottom).offset(1);
            make.width.mas_equalTo(152);
            make.height.mas_equalTo(19);
        }];
        
        NSArray *excelledItemArr = @[@"婚姻家庭",@"工伤赔偿"];
        float excelledItemViewWidth = 64*(excelledItemArr.count)+4;
        LawyerExcelledItemView *excelledItemView = [[LawyerExcelledItemView alloc] init];
        excelledItemView.layer.backgroundColor = [UIColor whiteColor].CGColor;
        excelledItemView.layer.cornerRadius = 10;
        [bgView addSubview:excelledItemView];
        [excelledItemView reloadItemWithInformation:excelledItemArr];
        [excelledItemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(workYearLab);
            make.top.equalTo(workYearLab.mas_bottom).offset(6);
            make.width.mas_equalTo(excelledItemViewWidth);
            make.height.mas_equalTo(25);
        }];
        
    }
    return self;
}


- (void)showBtn:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableviewCell:flagBtnTitle:)]) {
        [self.delegate tableviewCell:self flagBtnTitle:@"1"];
    }
}

- (void)layoutTableViewCell{
    self.titleLab.text = @"标题";
    self.sourceLab.text = @"我的新作品";
    self.commentLab.text = @"1888评论";
    self.timeLab.text = @"3个月前";
//    [self.titleLab sizeToFit];
//    [self.sourceLab sizeToFit];
//    [self.commentLab sizeToFit];
//    [self.timeLab sizeToFit];
    self.customImgV.image = [UIImage imageNamed:@"ALLImg.bundle/icon_carticket_click@2x.png"];
}


@end
