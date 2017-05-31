//
//  BaseAbstractController.h
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAbstractController : UIViewController

/**
 **传递到当前视图的参数函数*
 *
 *  @param argumentData
 */
- (void)argumentForCanvas:(id)argumentData;
/**
 *  设置导航栏左边的按钮
 */
-(void)setLeftNavgationBtn;
/**
 *
 * 设置导航栏右边按钮
 *  @param imgName 图片名
 */
-(void)setRightNavgationBtnWithImage:(NSString *)imgName;
-(void)setRightNavgationBtnWithImage:(NSString *)imgName selectImage:(NSString *)selectimgName;
/**
 *  设置导航栏标题
 *
 *  @param title
 */
-(void)setNavgationTitle:(NSString *)title;

-(void)setRightNavgationBtnWithTitle:(NSString *)title titleColor:(UIColor *)color;
/**
 *
 *
 *  @param canvasName   控制器名字
 *  @param argumentData 给下一级控制器传参
 *
 *  @return
 */
-(BaseAbstractController *)pushCanvas:(NSString *) canvasName withArgument:(id)argumentData;
/**
 *   返回到上一级控制器
 *
 *  @param argument 给上一级控制器传参数
 *
 *  @return
 */
- (BaseAbstractController *)popCanvasWithArgment:(id)argument;
- (BaseAbstractController *)popToCanvas:(NSString *) canvasName withArgument:(id)argumentData;
/**
 *   返回到根视图控制器
 *
 *  @param argumentData
 *
 *  @return
 */
- (BaseAbstractController *)popToRootCanvasWithArgment:(id)argumentData;
- (BaseAbstractController *)popToRootCanvasWithArgment:(id)argumentData afterSeconds:(int)seconds;
//向后退几级界面
- (BaseAbstractController *)popToCanvasWithGrade:(NSInteger)grade  withArgument:(id)argumentData;

@end
