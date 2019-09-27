//
//  ZLLMineViewController.m
//  MyApp
//
//  Created by ZLL on 2019/9/27.
//  Copyright © 2019 zll. All rights reserved.
//

#import "ZLLMineViewController.h"

@interface ZLLMineViewController ()
@property(nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property(nonatomic, strong) UIButton *signinBtn;
@property(nonatomic, strong) UIButton *signoutBtn;
@end

@implementation ZLLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.signinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.signinBtn.backgroundColor = [UIColor redColor];
    [self.signinBtn setTitle:@"signin" forState:UIControlStateNormal];
    [self.signinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.signinBtn.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:self.signinBtn];
    [self.signinBtn addTarget:self action:@selector(signinAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.signoutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.signoutBtn.backgroundColor = [UIColor redColor];
    [self.signoutBtn setTitle:@"signout" forState:UIControlStateNormal];
    [self.signoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.signoutBtn.frame = CGRectMake(100, 400, 100, 40);
    [self.view addSubview:self.signoutBtn];
    [self.signoutBtn addTarget:self action:@selector(signoutAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.frame = CGRectMake(self.view.frame.size.width / 2 - 20, self.view.frame.size.height / 2 - 20, 40, 40);
    [self.view addSubview:self.indicatorView];
    self.indicatorView.hidden = YES;
}


- (void)signinAction {
    [self signIn];
}

- (void)signoutAction {
    [self signOut];
}

- (void)signIn {
    WEAK_SELF
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
    NSURL *url = [NSURL URLWithString:@"http://123.59.168.93:89/client.do?method=checkin&type=checkin&latlng=39.9635888671875,116.3849544270833&addr=%E5%8C%97%E4%BA%AC%E5%B8%82%E8%A5%BF%E5%9F%8E%E5%8C%BA%E5%BE%B7%E8%83%9C%E8%A1%97%E9%81%93%E8%9C%80%E5%9B%BD%E6%BC%94%E4%B9%89%E9%85%92%E6%A5%BC(%E9%BB%84%E5%AF%BA%E6%97%97%E8%88%B0%E5%BA%97)%E5%8C%97%E5%B9%BF%E5%A4%A7%E5%8E%A6&sessionkey=abcAfDj985somhmhtesZw&wifiMac="];
    __block ASIHTTPRequest *request = [[ASIHTTPRequest alloc]initWithURL:url];
    request.useCookiePersistence = YES;
    NSDictionary *properties = [[NSMutableDictionary alloc]init];
    [properties setValue:@"" forKey:NSHTTPCookieValue];
    [properties setValue:@"ClientCountry=CN; ClientLanguage=zh-Hans; ClientMobile=; ClientToken=; ClientType=iPhone; ClientUDID=A62D1611-F0D1-4470-8B20-5A4D387ABB34; ClientVer=6.5.76; JSESSIONID=abcAfDj985somhmhtesZw; Pad=false; setClientOS=iOS; setClientOSVer=12.4.1; userKey=62cd517c-d46a-4df4-85ca-0c4df2003855; userid=63" forKey:NSHTTPCookieName];
    [properties setValue:@"123.59.168.93:89" forKey:NSHTTPCookieDomain];
    [properties setValue:@"/cookies" forKey:NSHTTPCookiePath];
    NSHTTPCookie *cookie = [[NSHTTPCookie alloc]initWithProperties:properties];
    [request setRequestCookies:[NSMutableArray arrayWithObject:cookie]];
    [request setUserAgentString:@"E-MobileE-Mobile 6.5.76 rv:6.5.76.1 (iPhone; iOS 12.4.1; zh_CN)"];
    [request setCompletionBlock:^{
        STRONG_SELF
        self.indicatorView.hidden = YES;
         [self.indicatorView stopAnimating];
    }];
    [request setFailedBlock:^{
        STRONG_SELF
        self.indicatorView.hidden = YES;
         [self.indicatorView stopAnimating];
    }];
    [request setRequestMethod:@"GET"];
    [request startAsynchronous];
}

- (void)signOut {
    WEAK_SELF
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
    NSURL *url = [NSURL URLWithString:@"http://123.59.168.93:89/client.do?method=checkin&type=checkout&latlng=39.9635888671875,116.3849544270833&addr=%E5%8C%97%E4%BA%AC%E5%B8%82%E8%A5%BF%E5%9F%8E%E5%8C%BA%E5%BE%B7%E8%83%9C%E8%A1%97%E9%81%93%E8%9C%80%E5%9B%BD%E6%BC%94%E4%B9%89%E9%85%92%E6%A5%BC(%E9%BB%84%E5%AF%BA%E6%97%97%E8%88%B0%E5%BA%97)%E5%8C%97%E5%B9%BF%E5%A4%A7%E5%8E%A6&sessionkey=abcAfDj985somhmhtesZw&wifiMac="];
    __block ASIHTTPRequest *request = [[ASIHTTPRequest alloc]initWithURL:url];
    request.useCookiePersistence = YES;
    NSDictionary *properties = [[NSMutableDictionary alloc]init];
    [properties setValue:@"" forKey:NSHTTPCookieValue];
    [properties setValue:@"ClientCountry=CN; ClientLanguage=zh-Hans; ClientMobile=; ClientToken=; ClientType=iPhone; ClientUDID=A62D1611-F0D1-4470-8B20-5A4D387ABB34; ClientVer=6.5.76; JSESSIONID=abcAfDj985somhmhtesZw; Pad=false; setClientOS=iOS; setClientOSVer=12.4.1; userKey=62cd517c-d46a-4df4-85ca-0c4df2003855; userid=63" forKey:NSHTTPCookieName];
    [properties setValue:@"123.59.168.93:89" forKey:NSHTTPCookieDomain];
    [properties setValue:@"/cookies" forKey:NSHTTPCookiePath];
    NSHTTPCookie *cookie = [[NSHTTPCookie alloc]initWithProperties:properties];
    [request setRequestCookies:[NSMutableArray arrayWithObject:cookie]];
    [request setUserAgentString:@"E-MobileE-Mobile 6.5.76 rv:6.5.76.1 (iPhone; iOS 12.4.1; zh_CN)"];
    [request setCompletionBlock:^{
      STRONG_SELF
        self.indicatorView.hidden = YES;
        [self.indicatorView stopAnimating];
    }];
    [request setFailedBlock:^{
        STRONG_SELF
        self.indicatorView.hidden = YES;
        [self.indicatorView stopAnimating];
    }];
    [request setRequestMethod:@"GET"];
    [request startAsynchronous];
}
@end
