//
//  ZLLListItem.h
//  MyApp
//
//  Created by ZLL on 2019/6/25.
//  Copyright © 2019 zll. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 列表结构化数据
 */
@interface ZLLListItem : NSObject <NSSecureCoding>
@property(nonatomic, copy) NSString *category;
@property(nonatomic, copy) NSString *picUrl;
@property(nonatomic, copy) NSString *uniquekey;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *date;
@property(nonatomic, copy) NSString *authorNae;
@property(nonatomic, copy) NSString *articleUrl;

- (void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
