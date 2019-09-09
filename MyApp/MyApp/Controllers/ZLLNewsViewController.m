//
//  ViewController.m
//  MyApp
//
//  Created by ZLL on 2019/5/13.
//  Copyright © 2019 zll. All rights reserved.
//

#import "ZLLNewsViewController.h"
#import "NormalTableViewCell.h"
#import "ZLLDetailViewController.h"
#import "ZLLDaleteCellView.h"
#import "ZLLListLoader.h"
#import "ZLLListItem.h"

@interface ZLLNewsViewController ()<UITableViewDataSource, UITableViewDelegate, NormalTableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) ZLLListLoader *listLoader;
@end

@implementation ZLLNewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    self.listLoader = [[ZLLListLoader alloc] init];
    __weak typeof(self)wself = self;
    [wself.listLoader loadListDataWithFinishedBlock:^(BOOL success, NSArray * _Nonnull dataArray) {
        __strong typeof(wself)strongSelf = self;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

- (void)setupUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
//    [tableView registerClass:[NormalTableViewCell class] forCellReuseIdentifier:@"NormalTableViewCell"];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.delegate = self;
    cell.item = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZLLListItem *item = self.dataArray[indexPath.row];
    ZLLDetailViewController *vc = [[ZLLDetailViewController alloc] initWithUrl:item.articleUrl];
    vc.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:vc animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
}

- (void)tableViewCell:(UITableViewCell *)cell clickDeleteButton:(UIButton *)deleteButton
{
    

    ZLLDaleteCellView *view = [[ZLLDaleteCellView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [cell convertRect:deleteButton.frame toView:nil];
//    __weak typeof(self)wself = self;
    [view showDeleteViewFromPoint:rect.origin cliclBlock:^{
//        __strong typeof(self) strongSelf = wself;
//        NSIndexPath *indexPath = [strongSelf.tableView indexPathForCell:cell];
//        [strongSelf.dataArray removeObjectAtIndex:indexPath.row];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
