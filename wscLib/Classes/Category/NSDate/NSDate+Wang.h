//
//  NSDate+Wang.h
//  wscLib
//
//  Created by shuchao on 2019/11/5.
//  Copyright © 2019 Mr.Wang. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Wang)
///计算时间距今 多长时间 
-(NSString *)getDifferStrFromNow;

/**
 *传入时间与当前时间的差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)date;

/**
 *是否为今年
 */
- (BOOL)isThisYear;

/**
 *是否为今天
 */
- (BOOL)isToday;

/**
 *是否为昨天
 */
- (BOOL)isYestoday;

/**
 *返回只有年月日的时间
 */
- (NSDate *)dateWithYMD;

@end

NS_ASSUME_NONNULL_END
