//
//  RecommendViewController.m
//  MyApp
//
//  Created by ZLL on 2019/5/21.
//  Copyright © 2019 zll. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, self.view.frame.size.height);
    for (int i = 0; i<5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
        view.backgroundColor = i%2 == 0 ? [UIColor redColor] :[UIColor blackColor];
        [scrollView addSubview:view];
    }
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    tapGesture.delegate = self;
    [testView addGestureRecognizer:tapGesture];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll---%@",@(scrollView.contentOffset));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

#pragma mark -tapGestureAction
- (void)tapGestureAction:(UITapGestureRecognizer *)tapGesture {
    NSLog(@"tapGestureAction--");
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return NO;
}
@end
