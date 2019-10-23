//
//  NSString+CheckString.m
//  ShareToMileOnDriver
//
//  Created by MAC－021-1005 on 2018/7/30.
//  Copyright © 2018年 renjian. All rights reserved.
//

#import "NSString+CheckString.h"

@implementation NSString (CheckString)

- (BOOL)isString {
    return [self isKindOfClass:[NSString class]];
}

- (BOOL)isNotEmpty {
    return (self.isString && self.length > 0);
}
//计算剩余时间
-(NSInteger )cacluteSurplusTime{

//    NSDateFormatter *strDateStr = [[NSDateFormatter alloc]init];
//    [strDateStr setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//
//    //        NSDate *startdate = [strDateStr dateFromString:startTime];
//    NSDate *startdate = [NSDate date];
//    NSDate *enddate = [strDateStr dateFromString:endTime];
//    //时间转时间戳的方法:
//    NSTimeInterval aTime = [enddate timeIntervalSinceDate:startdate];
   
    NSTimeInterval tempMilli = [self doubleValue];
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
   NSTimeInterval difValue = [date timeIntervalSinceNow];
    
    
//    [dateFormat setTimeZone:timeZone];
    return (NSInteger)(difValue / 60);
    
    
//    return ;//这里暂时 以后补充调整
}

-(NSString *)timeStrGetYYYY_MM_DD{
    NSTimeInterval tempMilli = [self doubleValue];
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [dateFormat setTimeZone:timeZone];
    return [dateFormat stringFromDate:date];
}

-(NSString *)timeStrGetYYYY_MM_DD_HHmmss{
    NSTimeInterval tempMilli = [self doubleValue];
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [dateFormat setTimeZone:timeZone];
    return [dateFormat stringFromDate:date];
}

-(NSString *)timeStrGetYYYY_MM_DD_HHmm{
    NSTimeInterval tempMilli = [self doubleValue];
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [dateFormat setTimeZone:timeZone];
    return [dateFormat stringFromDate:date];
}
-(CGFloat)getWidthWithFont:(UIFont *)font{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}].width+2;
}
-(CGSize)getSizeWithFont:(UIFont *)font{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}


//判断字符串是否是手机号
- (BOOL)isPhoneNumber {
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[156])\\d{8}$";
    NSString * CT = @"^1((33|53|8|7[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:self];
    BOOL res2 = [regextestcm evaluateWithObject:self];
    BOOL res3 = [regextestcu evaluateWithObject:self];
    BOOL res4 = [regextestct evaluateWithObject:self];
    
    if (res1 || res2 || res3 || res4 ) {
        return YES;
    } else {
        return NO;
    }
}
//判断是否是邮箱
- (BOOL)isEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
//判断是否是身份证号
- (BOOL) isValidateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}
-(NSString *)getMobileStrTypeDisplay{
    if (self.length == 11) {
        NSString *first = [self substringToIndex:3];
        NSString *last = [self substringFromIndex:(self.length-4)];
        return [NSString stringWithFormat:@"%@****%@",first,last];
    }
    return @"";
}
@end

