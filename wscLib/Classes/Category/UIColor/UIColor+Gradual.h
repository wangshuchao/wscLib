//
//  UIColor+Gradual.h
//  FlashShop
//
//  Created by MAC－021-1004 on 2018/7/4.
//  Copyright © 2018年 renjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Gradual)
/*绘制渐变色*/
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;
/*16进制转颜色*/
+ (UIColor *)colorWithHex:(NSString *)hexColor;
/*RGB转颜色*/
+(UIColor *)colorWithRGB:(NSString *)RGBStr;
/*16进制转颜色 int*/
+(UIColor *)colorHex:(int)hexColor;

// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)colorWithHexString:(NSString *)color;
@end
