//
//  UIImage+QREncode.h
//  ShareToMileOnDriver
//
//  Created by MAC－021-1004 on 2018/8/1.
//  Copyright © 2018年 renjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QREncode)

/**
 根据字符串生成二维码

 @param qrencodeStr 需要生成二维码的字符串
 @param width 宽 生成的二维码是一个正方形的 故宽高一致
 @return 二维码图片
 */
+(UIImage *)QRImageWithStr:(NSString *)qrencodeStr width:(CGFloat)width;


/// 两张图片合成
/// @param topImg 上面的image
/// @param rect 位置大小
-(UIImage *)addImage:(UIImage *)topImg toRect:(CGRect)rect;


@end
