//
//  PublishTabbar.m
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import "PublishTabbar.h"
#import "UIView+Ext.h"

@interface PublishTabbar ()
@property(nonatomic, weak) UIButton *plusButton;
@property(nonatomic, weak) UIView *reView;

/** 发布按钮 */
@property (nonatomic, weak) UIButton *releaseBtn;

@end

@implementation PublishTabbar

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
//        self.backgroundImage = [UIImage imageNamed:@"tabbar_back"];
//        self.shadowImage = [[UIImage alloc] init]; //等同于 去掉tabbar 的横线 release.layer.zPosition = 1000;
        
        UIButton *releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.releaseBtn = releaseBtn;
        [releaseBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon_38x38_"] forState:UIControlStateNormal];
        [releaseBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon_38x38_"] forState:UIControlStateHighlighted];
        releaseBtn.size = releaseBtn.currentBackgroundImage.size;
        [releaseBtn setTitle:@"发布" forState:UIControlStateNormal];
        [releaseBtn addTarget:self action:@selector(plusAction) forControlEvents:UIControlEventTouchUpInside];
        [releaseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        releaseBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        releaseBtn.titleEdgeInsets = UIEdgeInsetsMake(65, 0, 0, 0);
        [self addSubview:releaseBtn];
    }
    
    return self;
}

- (void)plusAction {
    if ([self.delegate respondsToSelector:@selector(tarBarDidPushReleaseClick:)]) {
        [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"prick_yuan"];
        [self.delegate tarBarDidPushReleaseClick:self];
    }
}


-(void)layoutSubviews {
    [super layoutSubviews];
    
    //去掉默认背景方块
    self.selectionIndicatorImage = [[UIImage alloc] init];
    
    //添加＋号按钮到中间位置
    self.releaseBtn.centerX = self.width * 0.5;
    self.releaseBtn.y = -10;
    
    CGFloat index = 0;
    CGFloat width = self.width / 5.0;
    Class class = NSClassFromString(@"UITabBarButton");
    for (UIView *item in self.subviews) {
        if ([item isKindOfClass:class]) {
            item.width = width;
            item.x = index * width;
            index ++;
            if (index == 2) {
                index ++;
            }
        }
    }
}

@end
