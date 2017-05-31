//
//  BaseAbstractController.m
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import "BaseAbstractController.h"
#import "BaseHelp.h"
#import "NSString+Ext.h"

@interface BaseAbstractController ()

@end

@implementation BaseAbstractController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.view.backgroundColor = VIEWBACKCOLOR;
    if (IS_OS_7_OR_LATER)
    {
        /*如果view里包含scrollview，不设置此属性，会显示位置不正确。*/
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        /*view里子视图如果不偏移64像素，会被覆盖*/
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        //        CGRect rect = self.view.frame;
        //        rect.origin.y += 20;
        //        self.view.frame = rect;
    }
    NSDictionary *navTitleArr = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0f],UITextAttributeFont, [UIColor whiteColor],UITextAttributeTextColor,nil];
    [self.navigationController.navigationBar setTintColor:MainColor];
    self.navigationController.navigationBar.titleTextAttributes = navTitleArr;
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[MainColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:theImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self setLeftNavgationBtn];
}


-(void)setLeftNavgationBtn{
    UIImage *img = [UIImage imageNamed:@"back"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(OnClickLeft) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 0, img.size.width+8, img.size.height+8)];
    /*这里可以加按钮背景*/
    [btn setImage:img forState:UIControlStateNormal];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backBtn;
}

-(void)setRightNavgationBtnWithImage:(NSString *)imgName
{
    UIImage *img = [UIImage imageNamed:imgName];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(OnClickRight) forControlEvents:UIControlEventTouchUpInside];
    float imgWidth = img.size.width;
    float imgHeight = img.size.height;
    if (imgWidth > 20) {
        imgWidth = 20;
    }
    if (imgHeight > 20) {
        imgHeight = 20;
    }
    [btn setFrame:CGRectMake(0, 0,imgWidth, imgWidth)];
    /*这里可以加按钮背景*/
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)setRightNavgationBtnWithImage:(NSString *)imgName selectImage:(NSString *)selectimgName
{
    UIImage *img = [UIImage imageNamed:imgName];
    UIImage *seimg = [UIImage imageNamed:selectimgName];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(OnClickRight) forControlEvents:UIControlEventTouchUpInside];
    float imgWidth = img.size.width;
    float imgHeight = img.size.height;
    if (imgWidth > 20) {
        imgWidth = 20;
    }
    if (imgHeight > 20) {
        imgHeight = 20;
    }
    [btn setFrame:CGRectMake(0, 0,imgWidth, imgWidth)];
    /*这里可以加按钮背景*/
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    [btn setBackgroundImage:seimg forState:UIControlStateSelected];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)setRightNavgationBtnWithTitle:(NSString *)title titleColor:(UIColor *)color
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(OnClickRight) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:TEXT_FONT];
    [btn.titleLabel setNeedsLayout];
    [btn.titleLabel layoutIfNeeded];
    CGSize size = [title sizeForFont:[UIFont systemFontOfSize:TEXT_FONT] constrainedToSize:CGSizeMake(MAXFLOAT, 40) lineBreakMode:NSLineBreakByCharWrapping];
    
    btn.frame = CGRectMake(0, 0, size.width, 40);
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)setNavgationTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = RGBACOLOR(0x3b, 0x45, 0x6c, 1.0);
    label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    [label setNeedsLayout];
    [label layoutIfNeeded];
    label.frame = CGRectMake((SCREEN_WIDTH - 200) / 2, 0, 200, 44);
    self.navigationItem.titleView = label;
}

-(void)OnClickLeft
{
    if(self == self.navigationController.viewControllers[0]){
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)OnClickRight{
    
}

- (void)argumentForCanvas:(id)argumentData{
    //用于子类继承该方法接收上一级页面传递的参数
}


-(BaseAbstractController *)pushCanvas:(NSString *) canvasName withArgument:(id)argumentData
{
    if (canvasName == nil) {
        return nil;
    }
    BaseAbstractController *baseVC = nil;
    Class object = NSClassFromString(canvasName);
    baseVC = (BaseAbstractController *)[[object alloc] init];
    if (baseVC) {
        if ([baseVC respondsToSelector:@selector(argumentForCanvas:)]) {
            if (argumentData) {
                [baseVC argumentForCanvas:argumentData];
            }
        }
        baseVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:baseVC animated:YES];
    }
    return baseVC;
}

- (BaseAbstractController *)popCanvasWithArgment:(id)argument
{
    BaseAbstractController *canvasController = nil;
    NSUInteger nViewControllerCount = [self.navigationController.viewControllers count];
    if (nViewControllerCount >= 2)
    {
        BaseAbstractController *canvasController = [self.navigationController.viewControllers objectAtIndex:nViewControllerCount - 2];
        if (canvasController)
        {
            if ([canvasController respondsToSelector:@selector(argumentForCanvas:)])
            {
                if (argument)
                {
                    [canvasController argumentForCanvas:argument];
                }
            }
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    return canvasController;
}

- (BaseAbstractController *)popToCanvas:(NSString *) canvasName withArgument:(id)argumentData
{
    BaseAbstractController *canvasController = nil;
    NSUInteger nViewControllerCount = [self.navigationController.viewControllers count];
    int grade = 0;
    for (int i = 0; i < nViewControllerCount; i++) {
        BaseAbstractController *tempVC = [self.navigationController.viewControllers objectAtIndex:i];
        if ([tempVC isKindOfClass:[canvasName class]]) {
            grade = i;
            break;
        }
    }
    NSInteger desCanvaseIndex = nViewControllerCount-1 - grade;
    if (desCanvaseIndex < 0)
    {
        desCanvaseIndex = 0;
    }
    canvasController = [self.navigationController.viewControllers objectAtIndex:desCanvaseIndex];
    if (canvasController)
    {
        if ([canvasController respondsToSelector:@selector(argumentForCanvas:)])
        {
            if (argumentData)
            {
                [canvasController argumentForCanvas:argumentData];
            }
        }
        [self.navigationController popToViewController:(UIViewController *)canvasController animated:YES];
    }
    return canvasController;
}

- (BaseAbstractController *)popToRootCanvasWithArgment:(id)argumentData
{
    BaseAbstractController *canvasController = nil;
    canvasController = [self.navigationController.viewControllers objectAtIndex:0];
    if (canvasController)
    {
        
        if ([canvasController respondsToSelector:@selector(argumentForCanvas:)])
        {
            if (argumentData)
            {
                [canvasController argumentForCanvas:argumentData];
            }
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    return canvasController;
}

- (BaseAbstractController *)popToRootCanvasWithArgment:(id)argumentData afterSeconds:(int)seconds{
    
    BaseAbstractController *canvasController = nil;
    canvasController = [self.navigationController.viewControllers objectAtIndex:0];
    if (canvasController)
    {
        
        if ([canvasController respondsToSelector:@selector(argumentForCanvas:)])
        {
            if (argumentData)
            {
                [canvasController argumentForCanvas:argumentData];
            }
        }
        sleep(seconds);
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    return canvasController;
}

- (BaseAbstractController *)popToCanvasWithGrade:(NSInteger)grade  withArgument:(id)argumentData
{
    NSArray *canvasControllers = [[NSArray alloc] initWithArray:self.navigationController.viewControllers];
    NSInteger currentCanvasIndex = canvasControllers.count - 1;
    NSInteger desCanvaseIndex = currentCanvasIndex - grade;
    if (desCanvaseIndex < 0)
    {
        desCanvaseIndex = 0;
    }
    BaseAbstractController *canvasController = [canvasControllers objectAtIndex:desCanvaseIndex];
    if (canvasController)
    {
        if ([canvasController respondsToSelector:@selector(argumentForCanvas:)])
        {
            if (argumentData)
            {
                [canvasController argumentForCanvas:argumentData];
            }
        }
        [self.navigationController popToViewController:(UIViewController *)canvasController animated:YES];
    }
    return canvasController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
