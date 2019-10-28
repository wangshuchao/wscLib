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



#pragma mark - NSMutableString

/*
 *  改变文本中某段文本的颜色, 大小
 *
 *  @param substringArray   需要改变的文本数组
 *  @param color            需要改变成的字体颜色
 *  @param fontSize         需要改变成的字体大小
 *  @param image            需要添加的图片
 *  @param imageBounds      需要添加的图片大小
 *
 *  @return 转换后的富文本
 */

- (NSMutableAttributedString*)changeToAttributeStringWithSubstringArray:(NSArray *)substringArray Color:(UIColor *)color FontSize:(float)fontSize image:(UIImage *)image imageBounds:(CGRect)imageBounds;

/**
 *  改变文本中某段文本的颜色, 大小
 *
 *  @param substringArray   需要改变的文本数组
 *  @param color            需要改变成的字体颜色
 *  @param fontSize         需要改变成的字体大小
 *
 *  @return 转换后的富文本
 */
- (NSMutableAttributedString *)changeToAttributeStringWithSubstringArray:(NSArray *)substringArray
                                                                   Color:(UIColor *)color
                                                                FontSize:(float)fontSize;

/**
 *  改变文本的字间距和行间距
 *
 *  @param wordSpaceSize    需要改变成的字间距大小, 0 代表默认
 *  @param lineSpaceSize    需要改变成的行间距大小, 0 代表默认
 *
 *  @return 转换后的富文本
 */
- (NSMutableAttributedString *)changeToAttributeStringWithWordSpaceSize:(float)wordSpaceSize
                                                          LineSpaceSize:(float)lineSpaceSize;

/**
 *  给文本中某段文本的添加删除线
 *
 *  @param substringArray   需要改变的文本数组
 *  @param deletelineColor  删除线颜色
 *
 *  @return 转换后的富文本
 */
- (NSMutableAttributedString *)changeToAttributeStringWithSubstringArray:(NSArray *)substringArray
                                                         DeletelineColor:(UIColor *)deletelineColor;

/**
 *  给文本中某段文本的添加下划线
 *
 *  @param substringArray   需要改变的文本数组
 *  @param color            文本颜色
 *  @param underlineColor   下划线颜色
 *
 *  @return 转换后的富文本
 */
- (NSMutableAttributedString *)changeToAttributeStringWithSubstringArray:(NSArray *)substringArray
                                                                   Color:(UIColor *)color
                                                          UnderlineColor:(UIColor *)underlineColor;

/**
 *  给文本中某段文本描边
 *
 *  @param substringArray   需要改变的文本数组
 *  @param borderWidth      描边的宽度
 *  @param borderColor      描边的颜色
 *
 *  @return 转换后的富文本
 */
- (NSMutableAttributedString *)changeToAttributeStringWithSubstringArray:(NSArray *)substringArray
                                                             BorderWidth:(float)borderWidth
                                                             BorderColor:(UIColor *)borderColor;





@end
