//
//  NormalTableViewCell.m
//  MyApp
//
//  Created by ZLL on 2019/5/22.
//  Copyright © 2019 zll. All rights reserved.
//

#import "NormalTableViewCell.h"
#import "ZLLListItem.h"

@interface NormalTableViewCell ()
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *sourceLabel;
@property(nonatomic, strong) UILabel *commentLabel;
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UIImageView *rightImageView;
@property(nonatomic, strong) UIButton *deleteButton;
@end

@implementation NormalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self setupMock];
    }
    return self;
}

- (void)setupUI {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.numberOfLines = 2;
    [self.contentView addSubview:self.titleLabel];
    
    self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,70, 50, 20)];
    self.sourceLabel.font = [UIFont systemFontOfSize:15];
    self.sourceLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.sourceLabel];
    
    self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 70, 50, 20)];
    self.commentLabel.font = [UIFont systemFontOfSize:15];
    self.commentLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.commentLabel];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 70, 50, 20)];
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    self.timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.timeLabel];
    
    self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 60, 60)];
//    self.rightImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.rightImageView];
    
//    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.deleteButton.frame = CGRectMake(270, 80, 30, 20);
//    self.deleteButton.backgroundColor = [UIColor redColor];
//    [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//    [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//    [self.deleteButton addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.deleteButton.layer.cornerRadius = 10.f;
//    self.deleteButton.layer.masksToBounds = YES;
//    self.deleteButton.layer.borderColor = [UIColor greenColor].CGColor;
//    self.deleteButton.layer.borderWidth = 2.f;
//    [self.contentView addSubview:self.deleteButton];
}

- (void)setupMock {
    self.titleLabel.text = @"这是标题";
    
    self.sourceLabel.text = @"这是来源";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"这是评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 10, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width , self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"这是时间";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 10, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:@"图片01"];
}

- (void)setItem:(ZLLListItem *)item {
    _item = item;
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniquekey];
    if (hasRead) {
        self.timeLabel.textColor = [UIColor lightGrayColor];
    }else {
        self.timeLabel.textColor = [UIColor blackColor];
    }
    self.titleLabel.text = item.title;
    
    self.sourceLabel.text =item.authorNae;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 10, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width , self.commentLabel.frame.size.height);
    
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 10, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
//    WEAK_SELF
//    NSThread *downLoadImgThread = [[NSThread alloc] initWithBlock:^{
//        STRONG_SELF
//        self.rightImageView.image =[UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//    }];
//    downLoadImgThread.name = @"downLoadImgThread";
//    [downLoadImgThread start];
    
//    dispatch_queue_global_t downQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//    dispatch_async(downQueue, ^{
//        STRONG_SELF
//        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_async(mainQueue, ^{
//            STRONG_SELF
//            self.rightImageView.image = image;
//        });
//    });
    
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
} 

- (void)deleteButtonAction:(UIButton *)sender {
    NSLog(@"deleteButtonAction");
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:sender];
    }
}

@end
