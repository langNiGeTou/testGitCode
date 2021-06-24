//
//  MoreLawyerTabCell.h
//  LegalAssistant
//
//  Created by lang on 2021/6/19.
//

#import <UIKit/UIKit.h>
#import "HomeTabDelegate.h"
NS_ASSUME_NONNULL_BEGIN


@interface MoreLawyerTabCell : UITableViewCell

@property (nonatomic,weak) id<HomeTabDelegate> delegate;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;

@end

NS_ASSUME_NONNULL_END
