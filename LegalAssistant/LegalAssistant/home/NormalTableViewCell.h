//
//  MyTableViewCell.h
//  gitTest
//
//  Created by 17090416 on 2021/4/11.
//

#import <UIKit/UIKit.h>
#import "HomeTabDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface NormalTableViewCell : UITableViewCell

@property (nonatomic,weak) id<HomeTabDelegate> delegate;

- (void)layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
