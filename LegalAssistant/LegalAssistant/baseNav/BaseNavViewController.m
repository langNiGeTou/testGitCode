//
//  baseNavViewController.m
//  LegalAssistant
//
//  Created by lang on 2021/6/16.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zx_navStatusBarStyle = ZXNavStatusBarStyleDefault;
    self.zx_showNavHistoryStackContentView = YES;
    //显示分割线
//    self.title = @"";
//    self.zx_navLineView.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc{
    NSLog(@"%@-dealloc",[self class]);
}


@end
