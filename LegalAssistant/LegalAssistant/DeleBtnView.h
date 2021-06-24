//
//  DeleBtnView.h
//  gitTest
//
//  Created by 17090416 on 2021/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleBtnView : UIView

- (void)showMyBtnWithPoint:(CGPoint)point showBtnBlock:(dispatch_block_t)showBtnBlock;

@end

NS_ASSUME_NONNULL_END
