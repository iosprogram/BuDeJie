//
//  EssenceViewController.m
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//  精华

#import "EssenceViewController.h"
#import "BaseSliderMenuBar.h"
#import "BaseHelp.h"
#import "UIView+Ext.h"


@interface EssenceViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
//当前控制器的页码
@property(nonatomic,  assign) NSUInteger page;
@property (nonatomic, strong) BaseSliderMenuBar *menuBar;
@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"百思不得姐";
    
    [self setRightNavgationBtnWithImage:@"RandomAcrossClickN_20x16_"selectImage:@"RandomAcrossClick_18x14_"];
    
    [self setupChildVC];
    [self setupTitlesView];
    [self setupScrollView];
}

//初始化只控制器
-(void)setupChildVC{
    //    全部
    UIViewController *vc_1 = [[UIViewController alloc] init];
    [self addChildViewController:vc_1];
    //    视频
    UIViewController *vc_2 = [[UIViewController alloc] init];
    [self addChildViewController:vc_2];
    //    图片
    UIViewController *vc_3 = [[UIViewController alloc] init];
    [self addChildViewController:vc_3];
    //    段子
    UIViewController *vc_4 = [[UIViewController alloc] init];
    [self addChildViewController:vc_4];
    //    排行
    UIViewController *vc_5 = [[UIViewController alloc] init];
    [self addChildViewController:vc_5];
}


- (void)setupScrollView{
    self.page = 0;
    //取消scrollView的contentinset自动调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-49-64-44);
    scrollView.backgroundColor = VIEWBACKCOLOR;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.alwaysBounceVertical = YES;
    scrollView.bounces = NO;
    [scrollView setScrollEnabled:YES];
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * SCREEN_WIDTH, 0);
    self.scrollView = scrollView;
    [self.view addSubview:self.scrollView];
    
    //设置默认显示第0个控制器
    [self.scrollView setContentOffset:CGPointMake(self.page * SCREEN_WIDTH, 0)];
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}


- (void)setupTitlesView{
    
    _menuBar = [[BaseSliderMenuBar alloc] initWithTitleArray:[NSArray arrayWithObjects:@"全部",@"视频",@"图片",@"段子",@"排行", nil]];
    
    _menuBar.backgroundColor = MainColor;
    
    _menuBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    
    [_menuBar setIndex:self.page];
    [self.view addSubview:_menuBar];
    __weak EssenceViewController *wself = self;
    [_menuBar setSliderMenuBarSlideredBlock:^(NSInteger sender) {
        wself.page = sender;
        [wself.scrollView setContentOffset:CGPointMake(self.page*SCREEN_WIDTH, 0)];
        [wself scrollViewDidEndScrollingAnimation:wself.scrollView];
    }];
}


#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //取出对应的子控制器
    int index = scrollView.contentOffset.x / scrollView.width;
    BaseAbstractController *willShowChildVC = self.childViewControllers[index];
    
    //如果控制器的view已经创建过,就直接返回
    if (willShowChildVC.isViewLoaded){
        [willShowChildVC.view removeFromSuperview];
    };
    //添加子控制器到scrollView
    willShowChildVC.view.frame = scrollView.bounds;
    
    [scrollView addSubview:willShowChildVC.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    //点击按钮
    int index = scrollView.contentOffset.x / scrollView.width;
    self.page = index;
    [_menuBar setIndex:self.page];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
