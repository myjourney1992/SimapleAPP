//
//  ZLLListLoader.h
//  MyApp
//
//  Created by ZLL on 2019/5/31.
//  Copyright © 2019 zll. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  ZLLListItem;


NS_ASSUME_NONNULL_BEGIN
typedef void(^zllLoaderFinishedBlock)(BOOL success,NSArray <ZLLListItem *> *dataArray);

/**
 列表请求
 */
@interface ZLLListLoader : NSObject

- (void)loadListDataWithFinishedBlock:(zllLoaderFinishedBlock)finishedBlock;
@end

NS_ASSUME_NONNULL_END
