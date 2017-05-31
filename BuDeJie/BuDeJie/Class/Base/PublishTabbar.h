//
//  PublishTabbar.h
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PublishTabbar;

@protocol TarBarDelegate <UITabBarDelegate>
@optional
- (void)tarBarDidPushReleaseClick:(PublishTabbar *)tarbar;
@end

@interface PublishTabbar : UITabBar

@property(nonatomic,assign) id<TarBarDelegate> delegate;
@end
