//
//  ZLLVideoCoverView.h
//  MyApp
//
//  Created by ZLL on 2019/9/5.
//  Copyright © 2019 zll. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLLVideoCoverView : UICollectionViewCell
- (void)layoutWithVideoCoverurl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;
@end

NS_ASSUME_NONNULL_END
