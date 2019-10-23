//
//  NSString+CheckString.h
//  ShareToMileOnDriver
//
//  Created by MAC－021-1005 on 2018/7/30.
//  Copyright © 2018年 renjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CheckString)

- (BOOL)isString;
- (BOOL)isNotEmpty;
//计算剩余时间 返回分钟
-(NSInteger)cacluteSurplusTime;

/**
 根据时间戳返回时间格式为YYYY-MM-DD的字符串

 @return YYYY-MM-DD
 */
-(NSString *)timeStrGetYYYY_MM_DD;

-(NSString *)timeStrGetYYYY_MM_DD_HHmmss;
-(NSString *)timeStrGetYYYY_MM_DD_HHmm;

/**
 获取字符串的宽度
 
 @param font 字体
 @return 宽
 */
-(CGFloat)getWidthWithFont:(UIFont *)font;
-(CGSize)getSizeWithFont:(UIFont *)font;

/**
 判断字符串是否是手机号
 
 @return 返回判断结果
 */
- (BOOL)isPhoneNumber;

/**
 获取手机号 123****5555

 @return 123****5555
 */
-(NSString *)getMobileStrTypeDisplay;
@end
