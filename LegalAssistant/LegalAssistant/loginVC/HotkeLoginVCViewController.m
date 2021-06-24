//
//  HotkeLoginVCViewController.m
//  LegalAssistant
//
//  Created by lang on 2021/6/16.
//

#import "HotkeLoginVCViewController.h"

@interface HotkeLoginVCViewController ()

@end

@implementation HotkeLoginVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *numbLabel = [[UILabel alloc] init];
    [self.view addSubview:numbLabel];
    NSMutableAttributedString *numbStr = [[NSMutableAttributedString alloc] initWithString:@"158****4487"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: GCW(28)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    numbLabel.attributedText = numbStr;
    numbLabel.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
    [numbLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(GCH(158));
        make.height.mas_equalTo(GCH(40));
        make.width.mas_equalTo(GCW(169));
    }];
    
    UILabel *txtLabel = [[UILabel alloc] init];
    [self.view addSubview:txtLabel];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"认证服务由中国移动提供"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: GCW(13)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    txtLabel.attributedText = string;
    txtLabel.textColor = [UIColor colorWithRed:179/255.0 green:186/255.0 blue:197/255.0 alpha:1.0];
    [txtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(numbLabel.mas_bottom).offset(GCH(8));
        make.height.mas_equalTo(GCH(18));
        make.width.mas_equalTo(GCW(144));
    }];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    loginBtn.layer.backgroundColor = [UIColor colorWithRed:46/255.0 green:99/255.0 blue:236/255.0 alpha:1.0].CGColor;
    loginBtn.layer.cornerRadius = 10;
    [self.view addSubview:loginBtn];
    NSMutableAttributedString *loginStr = [[NSMutableAttributedString alloc] initWithString:@"本机号码一键登录"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: GCW(15)],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    [loginBtn setAttributedTitle:loginStr forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(txtLabel.mas_bottom).offset(GCH(56));
        make.height.mas_equalTo(GCH(45));
        make.width.mas_equalTo(GCW(335));
    }];
    [loginBtn addTarget:self action:@selector(hotKeyLogin) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *otherBtn = [[UIButton alloc] init];
    otherBtn.layer.backgroundColor = [UIColor colorWithRed:46/255.0 green:99/255.0 blue:236/255.0 alpha:1.0].CGColor;
    otherBtn.layer.cornerRadius = 10;
    [self.view addSubview:otherBtn];
    NSMutableAttributedString *otherStr = [[NSMutableAttributedString alloc] initWithString:@"其他手机号登录"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: GCW(15)],NSForegroundColorAttributeName: [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0]}];[otherBtn setAttributedTitle:otherStr forState:UIControlStateNormal];
    [otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(loginBtn.mas_bottom).offset(GCH(16));
        make.height.mas_equalTo(GCH(45));
        make.width.mas_equalTo(GCW(335));
    }];
    [otherBtn addTarget:self action:@selector(otherLogin) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)hotKeyLogin
{
    
}

- (void)otherLogin
{
    
}


@end
