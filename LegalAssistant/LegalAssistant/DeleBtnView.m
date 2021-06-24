//
//  DeleBtnView.m
//  gitTest
//
//  Created by 17090416 on 2021/4/12.
//

#import "DeleBtnView.h"

@interface DeleBtnView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton *showBtn;
@property (nonatomic, copy) dispatch_block_t showBlock;
@end

@implementation DeleBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            self.bgView = [[UIView alloc]initWithFrame:self.bounds];
            self.bgView.backgroundColor = [UIColor blackColor];
            self.bgView.alpha = 0.5;
            self.bgView;
        })];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideView)];
        [self.bgView addGestureRecognizer:tap];
        
        [self addSubview:({
            self.showBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0,200,200)];
            [self.showBtn addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
            self.showBtn.backgroundColor = [UIColor yellowColor];
            self.showBtn;
        })];
    }
    return self;
}


- (void)dismissView
{
    [self removeFromSuperview];
}

- (void)showMyBtnWithPoint:(CGPoint)point showBtnBlock:(dispatch_block_t)showBtnBlock {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.showBlock = [showBtnBlock copy];//为什么要加copy
    self.showBtn.frame = CGRectMake(point.x, point.y+20, 200, 200);
    
    [UIView animateWithDuration:1.0f delay:0.5f usingSpringWithDamping:0.5f initialSpringVelocity:0.5f options:UIViewAnimationOptionCurveLinear animations:^{
        self.showBtn.frame = CGRectMake((self.bounds.size.width -200)/2, (self.bounds.size.height -200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"动画成功");
    }];
}

- (void)hideView
{
    self.showBlock();//block的实现
    [self removeFromSuperview];
}
@end
