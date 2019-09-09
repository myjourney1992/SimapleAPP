//
//  ZLLDetailViewController.m
//  MyApp
//
//  Created by ZLL on 2019/5/27.
//  Copyright © 2019 zll. All rights reserved.
//

#import "ZLLDetailViewController.h"
#import <WebKit/WebKit.h>

@interface ZLLDetailViewController ()<WKNavigationDelegate>
@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) UIProgressView *progressView;
@property(nonatomic, strong) NSString *url;
@end

@implementation ZLLDetailViewController

- (instancetype)initWithUrl:(NSString *)url {
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    //@"https://time.geekbang.org/course/intro/169"
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.webView.navigationDelegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew  context:nil];
    [self.view addSubview:self.webView];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    [self.view addSubview:self.progressView];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didFinishNavigation----");
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"");
    self.progressView.progress = self.webView.estimatedProgress;
}
@end
