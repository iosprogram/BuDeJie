//
//  BaseSliderMenuBar.h
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//  精华 新帖 顶部 滑动 菜单

#import <UIKit/UIKit.h>

typedef void(^SliderMenuBarSlidered)(NSInteger sender);

@interface BaseSliderMenuBar : UIView
/** <#title#> */
@property (nonatomic, copy) SliderMenuBarSlidered sliderMenuBarSlideredBlock;
@property (nonatomic, assign) NSInteger currentSelectedIndex;
- (id)initWithTitleArray:(NSArray *)titleArray;
-(void)setIndex:(NSInteger)index;
-(void)setSliderMenuBarSlideredBlock:(SliderMenuBarSlidered)sliderMenuBarSlideredBlock;

@end
