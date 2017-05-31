//
//  BaseSliderMenuBar.m
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import "BaseSliderMenuBar.h"
#import "BaseSliderMenuBtn.h"
#import "BaseHelp.h"
#import <Masonry.h>

@interface BaseSliderMenuBar ()
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation BaseSliderMenuBar

- (id)initWithTitleArray:(NSArray *)titleArray
{
    if (self = [super initWithFrame:CGRectZero]) {
        NSMutableArray *tempArray = [NSMutableArray array];
        self.dataSource = tempArray;
        BOOL isLast = NO;
        for (int i = 0; i < titleArray.count; i++) {
            if (i == titleArray.count -1) {
                isLast = YES;
            }
            BaseSliderMenuBtn *btn =[[BaseSliderMenuBtn alloc] initWithTitle:[titleArray objectAtIndex:i] isLastObj:isLast];
            btn.tag = i;
            [btn addTarget:self action:@selector(btnTouched:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [tempArray addObject:btn];
        }
        for (int i = 0; i < tempArray.count; i++) {
            UIButton *tempBtn = [tempArray objectAtIndex:i];
            float btn_width = SCREEN_WIDTH/tempArray.count;
            if (i == 0) {
                [tempBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.left.equalTo(self);
                    make.width.equalTo(@(btn_width));
                }];
            }else if (i == (tempArray.count-1))
            {
                [tempBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.right.equalTo(self);
                    make.width.equalTo(@(btn_width));
                }];
            }else{
                UIButton *tempBeforeBtn = [tempArray objectAtIndex:i-1];
                [tempBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.equalTo(self);
                    make.width.equalTo(@(btn_width));
                    make.left.equalTo(tempBeforeBtn.mas_right);
                }];
            }
        }
        //        UIView *bottomView = [[UIView alloc] init];
        //        bottomView.backgroundColor = DIVIDER_COLOR;
        //        [self addSubview:bottomView];
        //        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.bottom.equalTo(self);
        //            make.height.equalTo(@3);
        //            make.left.right.equalTo(self);
        //        }];
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.layer.masksToBounds = YES;
        _bottomLineView.layer.cornerRadius = 2.f;
        _bottomLineView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bottomLineView];
        UIButton *temp_btn = [self.dataSource objectAtIndex:_currentSelectedIndex];
        temp_btn.selected = YES;
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.height.equalTo(@2);
//            make.width.equalTo(temp_btn.mas_width).multipliedBy(0.235);
            make.width.equalTo(@30);
            make.centerX.equalTo(temp_btn);
        }];
        

    }
    return self;
}

-(void)setIndex:(NSInteger)index
{
    if (index != _currentSelectedIndex) {
        UIButton *temp = [self.dataSource objectAtIndex:_currentSelectedIndex];
        temp.selected = NO;
    }
    self.currentSelectedIndex = index;
    UIButton *temp_btn = [self.dataSource objectAtIndex:_currentSelectedIndex];
    temp_btn.selected = YES;
    [_bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.equalTo(@3);
        make.width.equalTo(temp_btn.mas_width).multipliedBy(0.235);
        make.centerX.equalTo(temp_btn);
    }];
}

-(void)btnTouched:(UIButton *)btn
{
    if (self.currentSelectedIndex == btn.tag) {
        return;
    }
    UIButton *temp_btn = [self.dataSource objectAtIndex:_currentSelectedIndex];
    temp_btn.selected = NO;
    self.currentSelectedIndex = btn.tag;
    [self setIndex:_currentSelectedIndex];
    if (self.sliderMenuBarSlideredBlock) {
        self.sliderMenuBarSlideredBlock(_currentSelectedIndex);
    }
}

-(void)setSliderMenuBarSlideredBlock:(SliderMenuBarSlidered)sliderMenuBarSlideredBlock
{
    if (sliderMenuBarSlideredBlock) {
        _sliderMenuBarSlideredBlock = nil;
        _sliderMenuBarSlideredBlock = sliderMenuBarSlideredBlock;
    }
}
@end
