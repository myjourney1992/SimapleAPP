//
//  ZLLVideoCoverView.m
//  MyApp
//
//  Created by ZLL on 2019/9/5.
//  Copyright © 2019 zll. All rights reserved.
//

#import "ZLLVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface ZLLVideoCoverView ()
@property(nonatomic, strong) AVPlayerItem *avPlayerItem;
@property(nonatomic, strong) AVPlayer *avPlayer;
@property(nonatomic, strong) AVPlayerLayer *avPlayerLayer;

@property(nonatomic, strong) MyLinearLayout *rootLayout;
@property(nonatomic, strong) UIImageView *coverView;
@property(nonatomic, strong) UIImageView *playView;
@property(nonatomic, strong) NSString *videoUrl;
@end

@implementation ZLLVideoCoverView
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.rootLayout = [[MyLinearLayout alloc] init];
    self.rootLayout.myMargin = 0;
    [self.contentView addSubview:self.rootLayout];
    
    self.coverView = [[UIImageView alloc] init];
    self.coverView.backgroundColor = [UIColor yellowColor];
    self.coverView.myMargin = 0;
    [self.rootLayout addSubview:self.coverView];
    
//    self.playView = [[UIImageView alloc] init];
//    self.playView.image = [UIImage imageNamed:@"videoPlay"];
//    self.playView.backgroundColor = [UIColor redColor];
//    self.playView.myCenterX = 0;
//    self.playView.myCenterY = 0;
//    self.playView.mySize = CGSizeMake(50, 50);
//    self.playView.userInteractionEnabled = YES;
//    [self.coverView addSubview:self.playView];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [self.coverView addGestureRecognizer:tap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePalyEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    NSURL *url = [NSURL URLWithString:self.videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:url];
    self.avPlayerItem = [AVPlayerItem playerItemWithAsset:asset];
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.avPlayerItem];
//    NSURL *url = [NSURL URLWithString:self.videoUrl];
//    AVPlayer *avPlayer = [AVPlayer playerWithURL:url];
    self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.avPlayerLayer.frame = self.coverView.bounds;
    [self.coverView.layer addSublayer:self.avPlayerLayer];
    
    [self.avPlayer play];
}

- (void)layoutWithVideoCoverurl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    self.coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
}

- (void)handlePalyEnd {
    [self.avPlayerLayer removeFromSuperlayer];
    self.avPlayerItem = nil;
    self.avPlayer = nil;
}
@end
