//
//  BaseSliderMenuBtn.h
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSliderMenuBtn : UIButton
@property (nonatomic, assign) NSInteger tag;
-(id)initWithTitle:(NSString *)title isLastObj:(BOOL)lastObj;
@end
