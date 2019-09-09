//
//  ZLLListLoader.m
//  MyApp
//
//  Created by ZLL on 2019/5/31.
//  Copyright © 2019 zll. All rights reserved.
//

#import "ZLLListLoader.h"
#import <AFNetworking.h>
#import "ZLLListItem.h"

@implementation ZLLListLoader

- (void)loadListDataWithFinishedBlock:(zllLoaderFinishedBlock)finishedBlock {
    NSArray <ZLLListItem *> *listData = [self readDAtaFromLocal];
    if (listData) {
        finishedBlock(YES,listData);
    }
    NSURL *url = [NSURL URLWithString:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e"];
    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = self;
        NSLog(@"");
        NSError *jsonError;
       id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray = [(NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"] objectForKey:@"data"];
        NSLog(@"");
        NSMutableArray *listItemArray = [NSMutableArray array];
        for (NSDictionary *info in dataArray) {
            ZLLListItem *item = [[ZLLListItem alloc] init];
            [item configWithDictionary:info];
            [listItemArray addObject:item];
        }
        [strongSelf archiveListDataWithArray:listItemArray.copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishedBlock) {
                finishedBlock(YES, listItemArray);
            }
        });
    }];
    [dataTask resume];
}

- (void)archiveListDataWithArray:(NSArray <ZLLListItem *> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileAMnager = [NSFileManager defaultManager];
    NSString *dataPath = [cachePath stringByAppendingPathComponent: @"ZLLData"];
    NSError *error;
    [fileAMnager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    if (@available(iOS 11.0, *)) {
        NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
        //    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
        [fileAMnager createFileAtPath:listDataPath contents:listData attributes:nil];
    } else {
        // Fallback on earlier versions
    }
    
//    BOOL fileExist = [fileAMnager fileExistsAtPath:listDataPath];
//
//    if (fileExist) {
//        [fileAMnager removeItemAtPath:listDataPath error:nil];
//    }
//    NSData *readListData = [fileAMnager contentsAtPath:listDataPath];
////    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ZLLListItem class], nil] fromData:readListData error:nil];
//
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"listData"];
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ZLLListItem class], nil] fromData:data error:nil];
//
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
//    NSLog(@"");
    
}

- (NSArray<ZLLListItem *> *)readDAtaFromLocal {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"ZLLData/list"];
    NSFileManager *fileAMnager = [NSFileManager defaultManager];
    NSData *readListData = [fileAMnager contentsAtPath:listDataPath];
    if (@available(iOS 11.0, *)) {
        id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ZLLListItem class], nil] fromData:readListData error:nil];
        if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
            return (NSArray<ZLLListItem *> *)unarchiveObj;
        }
    } else {
        // Fallback on earlier versions
    }
    return nil;
}
@end
