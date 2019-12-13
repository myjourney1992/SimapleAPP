//
//  SimpleAlertView.h
//  YanXiuStudentApp
//
//  Created by ZLL on 2017/7/4.
//  Copyright © 2017年 yanxiu.com. All rights reserved.
//

#import "AlertView.h"
#import "SimpleAlertButton.h"

extern CGFloat const kQADefaultContentViewWith;
typedef void(^ButtonActionBlock)(void);
@interface SimpleAlertButtonItem : NSObject
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, copy) ButtonActionBlock block;
@end
@interface SimpleAlertView : AlertView
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *describe;
@property (nonatomic, assign) BOOL hideAlertWhenButtonTapped; // default is YES
@property (nonatomic, assign) BOOL needCloseBtn;
@property (nonatomic, strong) NSMutableArray<SimpleAlertButtonItem *> *alertButtonItems;//有1~2个按钮


- (void)addButtonWithTitle:(NSString *)title style:(SimpleAlertActionStyle)style action:(ButtonActionBlock)buttonActionBlock;

- (void)show;
- (void)show:(BOOL)animated;
- (void)showInView:(UIView *)view;
- (void)showInView:(UIView *)view animated:(BOOL)animated;

@end
