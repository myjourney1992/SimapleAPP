//
//  NormalTableViewCell.h
//  MyApp
//
//  Created by ZLL on 2019/5/22.
//  Copyright © 2019 zll. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLLListItem;

NS_ASSUME_NONNULL_BEGIN
@protocol NormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)cell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface NormalTableViewCell : UITableViewCell
@property(nonatomic, weak) id <NormalTableViewCellDelegate> delegate;
@property(nonatomic, strong) ZLLListItem *item;
@end

NS_ASSUME_NONNULL_END
