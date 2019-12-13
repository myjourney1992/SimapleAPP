//
//  SimpleAlertButton.m
//  YanXiuStudentApp
//
//  Created by ZLL on 2017/7/4.
//  Copyright © 2017年 yanxiu.com. All rights reserved.
//

#import "SimpleAlertButton.h"

@implementation SimpleAlertButton

- (void)setStyle:(SimpleAlertActionStyle)style {
    _style = style;
    if (style == SimpleAlertActionStyle_Cancel) {
        self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [self setTitleColor:[UIColor colorWithHexString:@"#999FA7"] forState:UIControlStateNormal];
    }
    else if (style == SimpleAlertActionStyle_Default){
        self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [self setTitleColor:[UIColor colorWithHexString:@"#5293F5"] forState:UIControlStateNormal];
    }else if(style == SimpleAlertActionStyle_Alone){
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 45*kPhoneWidthRatio/2.f;
        self.backgroundColor = [UIColor colorWithHexString:@"#5293F5"];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
        [self setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
        
        [self setTitleColor:[UIColor colorWithHexString:@"999FA7"] forState:UIControlStateSelected];
        [self setBackgroundImage:[UIImage yx_createImageWithColor:[UIColor colorWithHexString:@"E1E0E5"]] forState:UIControlStateSelected];
    }
}

@end
