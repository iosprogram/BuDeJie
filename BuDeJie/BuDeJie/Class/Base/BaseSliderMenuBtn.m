//
//  BaseSliderMenuBtn.m
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import "BaseSliderMenuBtn.h"
#import <Masonry.h>

@implementation BaseSliderMenuBtn

-(id)initWithTitle:(NSString *)title isLastObj:(BOOL)lastObj
{
    self  = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:WLWColor(99, 99, 99) forState:UIControlStateNormal];
//        [self setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:13.f];
        if (!lastObj) {
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor clearColor];
            [self addSubview:lineView];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self);
                make.width.equalTo(@1);
                make.height.equalTo(self.mas_height).multipliedBy(0.5);
                make.centerY.equalTo(self);
            }];
        }
    }
    return self;
}


@end
