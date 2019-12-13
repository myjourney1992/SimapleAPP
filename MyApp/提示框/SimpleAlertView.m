//
//  SimpleAlertView.m
//  YanXiuStudentApp
//
//  Created by ZLL on 2017/7/4.
//  Copyright © 2017年 yanxiu.com. All rights reserved.
//

#import "SimpleAlertView.h"



@implementation SimpleAlertButtonItem
@end

@interface SimpleAlertView ()
@end

@implementation SimpleAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.alertButtonItems = [NSMutableArray array];
        self.hideAlertWhenButtonTapped = YES;
        self.needCloseBtn = NO;

    }
    return self;
}

#pragma mark - addButton
- (void)addButtonWithTitle:(NSString *)title style:(SimpleAlertActionStyle)style action:(ButtonActionBlock)buttonActionBlock {
    if (self.alertButtonItems.count > 2) {
        return;
    }
    SimpleAlertButton *button = [[SimpleAlertButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.style = style;
    SimpleAlertButtonItem *item = [[SimpleAlertButtonItem alloc]init];
    item.button = button;
    item.block = buttonActionBlock;
    [self.alertButtonItems addObject:item];
}

- (void)buttonAction:(SimpleAlertButton *)sender {
    if (self.hideAlertWhenButtonTapped) {
        [self hide];
    }
    [self.alertButtonItems enumerateObjectsUsingBlock:^(SimpleAlertButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([sender isEqual:obj.button]) {
            BLOCK_EXEC(obj.block);
            *stop = YES;
        }
    }];
}

#pragma mark - show
- (void)show {
    [self show:YES];
}

- (void)show:(BOOL)animated {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showInView:window animated:animated] ;
}

- (void)showInView:(UIView *)view {
    [self showInView:view animated:YES];
}

- (void)showInView:(UIView *)view animated:(BOOL)animated {
    LayoutBlock block = ^(AlertView *view) {
        [view.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (SCREEN_WIDTH > SCREEN_HEIGHT) {
                make.center.equalTo(self);
                make.width.mas_offset(SCREEN_HEIGHT * 0.8);
            }else{
                make.center.equalTo(self);
                make.left.mas_equalTo(38);
                make.right.mas_equalTo(-38);
            }
        }];
        if (animated) {
            self.alpha = 0.3;
            NSTimeInterval duration = animated ? 0.3f : 0;
            [UIView animateWithDuration:duration animations:^{
                self.alpha = 1.f;
            }];
        }
    };
    if (!self.contentView) {
        self.contentView = [self generateDefaultView];
    }
    [self showInView:view withLayout:block];
}

#pragma mark - defaultContentView
- (UIView *)generateDefaultView {
    UIView *defaultView = [[UIView alloc]init];
    defaultView.clipsToBounds = YES;
    defaultView.layer.cornerRadius = 12;
    defaultView.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
    
    if (self.needCloseBtn) {
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setImage:[UIImage imageNamed:@"pub_close_gray"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [defaultView addSubview:closeBtn];
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(3);
            make.right.mas_equalTo(-3);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
    }
    
    CGFloat ratio = SCREEN_WIDTH > SCREEN_HEIGHT ? 0.8 : 1.0;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithHexString:@"#111A38"];
    titleLabel.text = self.title;
    [defaultView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30*kPhoneWidthRatio * ratio);
        make.left.mas_equalTo(30*kPhoneWidthRatio * ratio);
        make.right.mas_equalTo(-30*kPhoneWidthRatio * ratio);
    }];
    
    UILabel *describeLabel = [[UILabel alloc]init];
    describeLabel.textAlignment = NSTextAlignmentCenter;
    describeLabel.font = [UIFont systemFontOfSize:15];
    describeLabel.textColor = [UIColor colorWithHexString:self.title.length == 0 ?@"#111A38":@"#999FA7"];
    describeLabel.text = self.describe;
    describeLabel.numberOfLines = 0;
    describeLabel.tag = 10086;
    [defaultView addSubview:describeLabel];
    [describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.title.length == 0) {
            make.top.mas_equalTo(30*kPhoneWidthRatio * ratio);
        } else {
            make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(21*kPhoneWidthRatio * ratio);
        }
        make.centerX.equalTo(defaultView.mas_centerX);
        make.left.mas_greaterThanOrEqualTo(30*kPhoneWidthRatio * ratio);
        make.right.mas_lessThanOrEqualTo(-30*kPhoneWidthRatio * ratio);
    }];
    
    UIView *bottomView = [[UIView alloc]init];
    [defaultView  addSubview:bottomView];
    [self.alertButtonItems enumerateObjectsUsingBlock:^(SimpleAlertButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = obj.button;
        [bottomView addSubview:button];
    }];
    CGFloat bottomViewHeight = SCREEN_WIDTH > SCREEN_HEIGHT ? 60 : 58*kPhoneWidthRatio;
    CGFloat bottomViewTop = SCREEN_WIDTH > SCREEN_HEIGHT ? 30 : 35*kPhoneWidthRatio;
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.describe.length == 0) {
            make.top.greaterThanOrEqualTo(titleLabel.mas_bottom).offset(bottomViewTop);
        } else {
            make.top.greaterThanOrEqualTo(describeLabel.mas_bottom).offset(bottomViewTop);
        }
        make.left.right.equalTo(defaultView);
        make.height.mas_equalTo(bottomViewHeight);
        make.bottom.equalTo(defaultView);
    }];
    NSInteger buttonCount = bottomView.subviews.count;
    CGFloat buttonHeight = SCREEN_WIDTH > SCREEN_HEIGHT ? 55 :45*kPhoneWidthRatio;
    if (buttonCount == 1) {
        [bottomView.subviews.firstObject mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bottomView);
            make.top.equalTo(bottomView);
            make.height.mas_equalTo(buttonHeight);
            make.width.mas_equalTo(bottomView.mas_width).offset(-40*kPhoneWidthRatio);
        }];
    }
    if (buttonCount == 2) {
        [bottomView.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(idx?bottomView.mas_centerX:bottomView);
                make.centerY.equalTo(bottomView);
                make.width.mas_equalTo(bottomView.mas_width).multipliedBy(.5f);
                make.height.mas_equalTo(bottomViewHeight);
            }];
        }];
    }
    return  defaultView;
}


@end
