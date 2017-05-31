//
//  NSString+Ext.h
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Ext)
- (CGSize) sizeForFont:(UIFont *)font;

- (CGSize) sizeForFont:(UIFont*)font
     constrainedToSize:(CGSize)constraint
         lineBreakMode:(NSLineBreakMode)lineBreakMode;
@end
