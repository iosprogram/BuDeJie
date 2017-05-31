//
//  BaseHelp.h
//  BuDeJie
//
//  Created by wlw0003 on 2017/5/31.
//  Copyright © 2017年 MHW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <Toast/UIView+Toast.h>
#import <Masonry.h>


#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define MainColor (RGBACOLOR(0xff,0x14,0x46,1.0))
#define NAVGATIONBARCOLOR (RGBACOLOR(0xff,0xff,0xff,1.0))
#define DIVIDER_COLOR (RGBACOLOR(0xd8,0xd8,0xd8,1.0))
#define BACKGROUND_RGBCOLOR (RGBACOLOR(0xeb, 0xeb, 0xeb, 1.0f))
#define HEADSECTION_BK_COLOR (RGBACOLOR(0xf7,0xf7,0xf7,1.0f))
#define HEADSECTION_FONT_COLOR (RGBACOLOR(0x81,0x81,0x81,1.0f))
#define VIEWBACKCOLOR (RGBACOLOR(0xf2, 0xf2, 0xf2, 1.0f))
#define MIDDLESEPERATECOLOR  (RGBACOLOR(0xe1, 0xe1, 0xe1, 1.0f))
#define BOTTOMSEPERATECOLOR  (RGBACOLOR(0xfa, 0x84, 0x00, 1.0f))
#define NAVBARTITLE          (RGBACOLOR(0x64, 0x38, 0x05, 1.0f))
#define CELLTITLECOLOR          (RGBACOLOR(0x33, 0x33, 0x33, 1.0f))
#define ORANGECOLOR          (RGBACOLOR(0xff, 0x78, 0x3c, 1.0))

#define TEXT_FONT  13.f

#define COMMON_VIEW_XOFFSET (14)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_7  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 || [[[UIDevice currentDevice] systemVersion] floatValue] <= 8.0 )
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_OBJECT_NULL(object) (object == nil)
#define IS_NSSTRING_EMPTY(object)  !([object isKindOfClass:[NSString class]] && [(NSString *)object length])
#define IS_NSSTIRNG_CONTAIN(sourStr, str) ([sourStr rangeOfString:str].location != NSNotFound)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)


@interface BaseHelp : NSObject

@end
