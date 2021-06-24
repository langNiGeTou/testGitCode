//
//  HomeTabDelegate.h
//  LegalAssistant
//
//  Created by lang on 2021/6/19.
//

#import <Foundation/Foundation.h>

@protocol HomeTabDelegate <NSObject>

- (void)tableviewCell:(UITableViewCell *)tableviewcell flagBtnTitle:(NSString *)flagStr;

@end
