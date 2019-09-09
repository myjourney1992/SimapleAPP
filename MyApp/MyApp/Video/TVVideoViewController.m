//
//  TVVideoViewController.m
//  MyApp
//
//  Created by ZLL on 2019/5/20.
//  Copyright © 2019 zll. All rights reserved.
//

#import "TVVideoViewController.h"
#import "ZLLVideoCoverView.h"

@interface TVVideoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation TVVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width /16 * 9);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[ZLLVideoCoverView class] forCellWithReuseIdentifier:@"ZLLVideoCoverView"];
    [self.view addSubview:collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZLLVideoCoverView" forIndexPath:indexPath];
    if ([cell isKindOfClass:[ZLLVideoCoverView class]]) {
        [((ZLLVideoCoverView *)cell) layoutWithVideoCoverurl:@"videoCover" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.item % 3 ==0) {
        return CGSizeMake(self.view.frame.size.width, 300);
//    }
//    return CGSizeMake((self.view.frame.size.width - 30)/2, 300);
}
@end
