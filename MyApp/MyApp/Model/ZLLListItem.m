//
//  ZLLListItem.m
//  MyApp
//
//  Created by ZLL on 2019/6/25.
//  Copyright © 2019 zll. All rights reserved.
//

#import "ZLLListItem.h"

@implementation ZLLListItem

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
        self.uniquekey = [aDecoder decodeObjectForKey:@"uniquekey"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.authorNae = [aDecoder decodeObjectForKey:@"authorNae"];
        self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
    [aCoder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.authorNae forKey:@"authorNae"];
    [aCoder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)configWithDictionary:(NSDictionary *)dictionary {
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorNae = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
    
}

@end
