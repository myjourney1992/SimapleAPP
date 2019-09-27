//
//  ZLLDaleteCellView.h
//  MyApp
//
//  Created by ZLL on 2019/5/28.
//  Copyright © 2019 zll. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 点击出现的cell确认浮层
 */
@interface ZLLDaleteCellView : UIView

/**
 显示弹窗

 @param point 点击的位置
 @param block 点击后的回调
 */
- (void)showDeleteViewFromPoint:(CGPoint)point cliclBlock:(dispatch_block_t)block;
- (void)dismissDeleteView;
@end

NS_ASSUME_NONNULL_END
