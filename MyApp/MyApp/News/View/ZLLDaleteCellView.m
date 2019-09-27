//
//  ZLLDaleteCellView.m
//  MyApp
//
//  Created by ZLL on 2019/5/28.
//  Copyright © 2019 zll. All rights reserved.
//

#import "ZLLDaleteCellView.h"

@interface ZLLDaleteCellView ()
@property(nonatomic, strong) UIView *backgroundview;
@property(nonatomic, strong) UIButton *deleteButton;
@property(nonatomic, copy) dispatch_block_t deleteBlock;
@end

@implementation ZLLDaleteCellView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundview = [[UIView alloc] initWithFrame:self.bounds];
    self.backgroundview.backgroundColor = [UIColor blackColor];
    self.backgroundview.alpha = .7f;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.backgroundview addGestureRecognizer:tap];
    [self addSubview:self.backgroundview];
    
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteButton.frame = CGRectMake(0, 0, 0, 0);
    [self.deleteButton addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.deleteButton.backgroundColor = [UIColor redColor];
    [self addSubview:self.deleteButton];
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    [self removeFromSuperview];
}

- (void)deleteButtonAction:(UIButton *)sender {
    if (_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}

- (void)showDeleteViewFromPoint:(CGPoint)point cliclBlock:(dispatch_block_t)block {
    self.deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = block;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:1.f delay:.0f usingSpringWithDamping:0.5f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.frame.size.width - 200)/ 2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}
@end
