//
//  MainTabViewController.m
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import "MainTabViewController.h"

#import "EssenceViewController.h"
#import "NewViewController.h"
#import "PublishViewController.h"
#import "FocusViewController.h"
#import "MeViewController.h"

#import "PublishTabbar.h"

@interface MainTabViewController ()<TarBarDelegate>

@end

@implementation MainTabViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],
                                                       
                                                       NSForegroundColorAttributeName,
                                                       
                                                       nil]
     
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],
                                                       
                                                       NSForegroundColorAttributeName,
                                                       
                                                       nil]
     
                                             forState:UIControlStateSelected];
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;

    //修改背景颜色tabbar
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    [self setUpChild];
    

}

- (void)setUpChild
{
    EssenceViewController *essence = [[EssenceViewController alloc]init];
    essence.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"精华" image:[[UIImage imageNamed:@"tabBar_essence_icon_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"tabBar_essence_click_icon_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    UINavigationController *essenceNav = [[UINavigationController alloc] initWithRootViewController:essence];
    
    NewViewController *new = [[NewViewController alloc]init];
    new.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新帖" image:[[UIImage imageNamed:@"tabBar_new_iconN_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"tabBar_new_click_icon_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    UINavigationController *newNav = [[UINavigationController alloc] initWithRootViewController:new];

//    PublishViewController *publish = [[PublishViewController alloc] init];
//    publish.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发布" image:[[UIImage imageNamed:@"tabBar_publish_icon_38x38_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"tabBar_publish_click_icon_38x38_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
//    UINavigationController *publishNav = [[UINavigationController alloc] initWithRootViewController:publish];
    
    FocusViewController *focus = [[FocusViewController alloc] init];
    focus.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:[[UIImage imageNamed:@"tabBar_friendTrends_icon_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"tabBar_friendTrends_click_icon_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    UINavigationController *focusNav = [[UINavigationController alloc] initWithRootViewController:focus];
    
    MeViewController *me = [[MeViewController alloc]init];
    me.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabBar_me_iconN_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"tabBar_me_click_icon_27x27_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:me];
    
    
    
    PublishTabbar *tabbar = [[PublishTabbar alloc] init];
    tabbar.delegate = self;
    [self setValue:tabbar forKey:@"tabBar"];
    
    
    self.viewControllers = @[essenceNav,newNav,focusNav,meNav];
    self.selectedIndex = 0;
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
