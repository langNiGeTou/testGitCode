//
//  ChooseIdentityVC.m
//  LegalAssistant
//
//  Created by lang on 2021/6/15.
//

#import "ChooseIdentityVC.h"
#import "UIColor+extend.h"
@interface ChooseIdentityVC ()

@property (nonatomic, strong) UIImageView *oneImgView;
@property (nonatomic, strong) UIImageView *twoImgView;
@end

@implementation ChooseIdentityVC
@synthesize oneImgView,twoImgView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLab = [[UILabel alloc] init];
    [self.view addSubview:titleLab];
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:@"你的身份是？" attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: GCW(24)],NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    titleLab.attributedText = titleStr;
    titleLab.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(GCW(20));
        make.right.equalTo(self.view).offset(GCW(-211));
        make.top.equalTo(self.view).offset(GCH(111));
        make.height.mas_equalTo(GCH(33));
    }];
    
    oneImgView = [[UIImageView alloc] init];
    oneImgView.image = [UIImage imageNamed:@"woman"];
    oneImgView.userInteractionEnabled = YES;
    [self.view addSubview:oneImgView];
    oneImgView.tag = 1;
    oneImgView.layer.cornerRadius = 10;
    oneImgView.layer.borderWidth = 1;
    oneImgView.layer.borderColor = [UIColor clearColor].CGColor;
    [oneImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(GCW(20));
        make.right.equalTo(self.view).offset(GCW(-20));
        make.top.equalTo(self.view).offset(GCH(184));
        make.height.mas_equalTo(GCH(113));
    }];
    
    UILabel *peopleLab = [[UILabel alloc] init];
    [oneImgView addSubview:peopleLab];
    NSMutableAttributedString *peopleStr = [[NSMutableAttributedString alloc] initWithString:@"我是个人"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: GCW(16)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    peopleLab.attributedText = peopleStr;
    peopleLab.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
    [peopleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oneImgView).offset(GCW(139));
        make.right.equalTo(oneImgView).offset(GCW(-120));
        make.top.equalTo(oneImgView).offset(GCH(33));
        make.height.mas_equalTo(GCH(22));
    }];
    
    UILabel *plLab = [[UILabel alloc] init];
    [oneImgView addSubview:plLab];
    NSMutableAttributedString *lawyerStr = [[NSMutableAttributedString alloc] initWithString:@"在线咨询，打官司，法律援助"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: GCW(13)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    plLab.attributedText = lawyerStr;
    plLab.textColor = [UIColor colorWithRed:137/255.0 green:147/255.0 blue:164/255.0 alpha:1.0];
    [plLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oneImgView).offset(GCW(139));
        make.right.equalTo(oneImgView).offset(GCW(-20));
        make.bottom.equalTo(oneImgView).offset(GCH(-34));
        make.height.mas_equalTo(GCH(18));
    }];
    
    //单击的手势
    UITapGestureRecognizer *tapOneImg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapOneImg:)];
    tapOneImg.numberOfTapsRequired = 1;
    [oneImgView addGestureRecognizer:tapOneImg];
    
    twoImgView = [[UIImageView alloc] init];
    twoImgView.image = [UIImage imageNamed:@"man"];
    twoImgView.userInteractionEnabled = YES;
    [self.view addSubview:twoImgView];
    twoImgView.layer.cornerRadius = 10;
    twoImgView.layer.borderWidth = 1;
    twoImgView.layer.borderColor = [UIColor clearColor].CGColor;
    twoImgView.tag = 2;
    [twoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(GCW(20));
        make.right.equalTo(self.view).offset(GCW(-20));
        make.top.equalTo(oneImgView.mas_bottom).offset(GCH(24));
        make.height.mas_equalTo(GCH(113));
    }];
    //单击的手势
    UITapGestureRecognizer *tapTwoImg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapOneImg:)];
    tapTwoImg.numberOfTapsRequired = 1;
    [twoImgView addGestureRecognizer:tapTwoImg];
    
    UILabel *lawyLab = [[UILabel alloc] init];
    [twoImgView addSubview:lawyLab];
    NSMutableAttributedString *lawyStr = [[NSMutableAttributedString alloc] initWithString:@"我是律师"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: GCW(16)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    lawyLab.attributedText = lawyStr;
    lawyLab.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
    [lawyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(twoImgView).offset(GCW(139));
        make.right.equalTo(twoImgView).offset(GCW(-120));
        make.top.equalTo(twoImgView).offset(GCH(33));
        make.height.mas_equalTo(GCH(22));
    }];

    UILabel *lawyTxtLab = [[UILabel alloc] init];
    [twoImgView addSubview:lawyTxtLab];
    NSMutableAttributedString *lawyTxtStr = [[NSMutableAttributedString alloc] initWithString:@"在线咨询，找案源，律师协作"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: GCW(13)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    lawyTxtLab.attributedText = lawyTxtStr;
    lawyTxtLab.textColor = [UIColor colorWithRed:137/255.0 green:147/255.0 blue:164/255.0 alpha:1.0];
    [lawyTxtLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(twoImgView).offset(GCW(139));
        make.right.equalTo(twoImgView).offset(GCW(-20));
        make.bottom.equalTo(twoImgView).offset(GCH(-34));
        make.height.mas_equalTo(GCH(18));
    }];

    UIButton *nextBtn = [[UIButton alloc] init];
    nextBtn.frame = CGRectMake(20,507,335,45);
    nextBtn.layer.backgroundColor = [UIColor colorWithRed:46/255.0 green:99/255.0 blue:236/255.0 alpha:1.0].CGColor;
    nextBtn.layer.cornerRadius = 10;
    [self.view addSubview:nextBtn];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(GCW(20));
        make.right.equalTo(self.view).offset(GCW(-20));
        make.top.equalTo(twoImgView.mas_bottom).offset(GCH(73));
        make.height.mas_equalTo(GCH(45));
    }];
    [nextBtn addTarget:self action:@selector(doNext) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)doNext{
    
}


- (void)doTapOneImg:(UITapGestureRecognizer *)recognizer
{
    UITapGestureRecognizer *sender = (UITapGestureRecognizer *)recognizer;
    if ([sender view].tag == 1) {
        oneImgView.layer.borderColor = [UIColor getColor:@"2E63EC"].CGColor;
        twoImgView.layer.borderColor = [UIColor clearColor].CGColor;
    }else{
        twoImgView.layer.borderColor = [UIColor getColor:@"2E63EC"].CGColor;
        oneImgView.layer.borderColor = [UIColor clearColor].CGColor;
    }
}

@end
