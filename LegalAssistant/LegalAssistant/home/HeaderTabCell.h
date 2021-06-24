//
//  HeaderTabCell.h
//  LegalAssistant
//
//  Created by lang on 2021/6/19.
//

#import <UIKit/UIKit.h>
#import "HomeTabDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface HeaderTabCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;
@property (nonatomic,weak) id<HomeTabDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
