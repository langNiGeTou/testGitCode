//
//  HeaderTabCell.m
//  LegalAssistant
//
//  Created by lang on 2021/6/19.
//

#import "HeaderTabCell.h"
#import "CustomItemView.h"
@implementation HeaderTabCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *titleHomeBannerImgV = [[UIImageView alloc] init];
        titleHomeBannerImgV.image = [UIImage imageNamed:@"titleHomeBanner"];
        titleHomeBannerImgV.userInteractionEnabled = YES;
        [self.contentView addSubview:titleHomeBannerImgV];
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(7,64,368,210);
        gl.startPoint = CGPointMake(0.13, 0.13);
        gl.endPoint = CGPointMake(0.86, 0.71);
        gl.colors = @[(__bridge id)[UIColor colorWithRed:49/255.0 green:94/255.0 blue:219/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:71/255.0 green:114/255.0 blue:224/255.0 alpha:1.0].CGColor];
        gl.locations = @[@(0), @(1.0f)];
        titleHomeBannerImgV.layer.shadowOffset = CGSizeMake(0,GCH(10));
        titleHomeBannerImgV.layer.shadowOpacity = 1;
        titleHomeBannerImgV.layer.shadowRadius = GCW(20);
    //    titleHomeBannerImgV.layer.shadowColor = RGB(71, 117, 236).CGColor;//阴影颜色
        titleHomeBannerImgV.layer.shadowColor = [UIColor colorWithRed:71/255.0 green:117/255.0 blue:236/255.0 alpha:0.6].CGColor;
        [titleHomeBannerImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(GCH(10));
            make.width.mas_equalTo(343);
            make.height.mas_equalTo(130);
        }];

        CustomItemView *rewardCtrl = [[CustomItemView alloc] initWithName:@"悬赏咨询" Image:@"reward"];
        rewardCtrl.userInteractionEnabled = YES;
        [self.contentView addSubview:rewardCtrl];
        [rewardCtrl.itemBtn addTarget:self action:@selector(doReward) forControlEvents:UIControlEventTouchUpInside];
        [rewardCtrl addTarget:self action:@selector(doReward) forControlEvents:UIControlEventTouchUpInside];



        CustomItemView *lookForLawyerCtrl = [[CustomItemView alloc] initWithName:@"找律师" Image:@"lookForLawyer"];;
        lookForLawyerCtrl.userInteractionEnabled = YES;
        [self.contentView addSubview:lookForLawyerCtrl];
        [lookForLawyerCtrl.itemBtn addTarget:self action:@selector(doReward) forControlEvents:UIControlEventTouchUpInside];
        [lookForLawyerCtrl addTarget:self action:@selector(doLookForLawye) forControlEvents:UIControlEventTouchUpInside];

        CustomItemView *contractCtrl = [[CustomItemView alloc] initWithName:@"文书合同" Image:@"contract"];;
        contractCtrl.userInteractionEnabled = YES;
        [self.contentView addSubview:contractCtrl];
        [contractCtrl.itemBtn addTarget:self action:@selector(doReward) forControlEvents:UIControlEventTouchUpInside];
        [contractCtrl addTarget:self action:@selector(doContract) forControlEvents:UIControlEventTouchUpInside];

        NSArray *viewsArr = @[rewardCtrl, lookForLawyerCtrl, contractCtrl];
        [viewsArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:56 leadSpacing:45 tailSpacing:45];
        [viewsArr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleHomeBannerImgV.mas_bottom).offset(21);
            make.height.mas_equalTo(67);
        }];
    }
    return self;
}

- (void)doReward{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableviewCell:flagBtnTitle:)]) {
        [self.delegate tableviewCell:self flagBtnTitle:@"Reward"];
    }
    NSLog(@"悬赏咨询");
}

- (void)doLookForLawye{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableviewCell:flagBtnTitle:)]) {
        [self.delegate tableviewCell:self flagBtnTitle:@"LookForLawye"];
    }
    NSLog(@"找律师");
}

- (void)doContract{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableviewCell:flagBtnTitle:)]) {
        [self.delegate tableviewCell:self flagBtnTitle:@"Contract"];
    }
    NSLog(@"文书合同");
}

- (void)showBtn:(UIButton *)btn{
    
}

- (void)layoutTableViewCell{

//    [self.titleLab sizeToFit];
//    [self.sourceLab sizeToFit];
//    [self.commentLab sizeToFit];
//    [self.timeLab sizeToFit];
//    self.customImgV.image = [UIImage imageNamed:@"ALLImg.bundle/icon_carticket_click@2x.png"];
}
@end
