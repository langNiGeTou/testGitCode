//
//  CustomNavViewController.m
//  LegalAssistant
//
//  Created by lang on 2021/6/16.
//

#import "CustomNavViewController.h"
#import "ZXNavigationBarDefine.h"

@interface CustomNavViewController ()


@end

@implementation CustomNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.zx_navFixFrame = CGRectMake(0, 0, 200, 100);
    [self setUpNav];
}

- (void)setUpNav{
    self.zx_navLeftBtn.zx_fixImageSize = CGSizeMake(16, 20);
    self.zx_navSubLeftBtn.zx_fixImageSize = CGSizeMake(50, 21);
    self.zx_navSubLeftBtn.zx_fixMarginLeft = 0;
    NSMutableAttributedString *cityStr = [[NSMutableAttributedString alloc] initWithString:@"南京市" attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:15],NSForegroundColorAttributeName: RGBA(23, 43, 77, 1)}];
    [self.zx_navSubLeftBtn setAttributedTitle:cityStr forState:UIControlStateNormal];
    [self zx_setLeftBtnWithImg:[UIImage imageNamed:@"location"] clickedBlock:^(ZXNavItemBtn * _Nonnull btn) {

    }];
    

    
}



- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

@end
