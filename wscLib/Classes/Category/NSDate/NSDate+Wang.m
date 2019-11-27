//
//  NSDate+Wang.m
//  NewZTalk
//
//  Created by shuchao on 2019/11/5.
//  Copyright © 2019 Mr.Wang. All rights reserved.
//

#import "NSDate+Wang.h"




@implementation NSDate (Wang)
-(NSString *)getDifferStrFromNow{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | kCFCalendarUnitWeekday;
    // 3.利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type fromDate:self toDate:[NSDate date] options:0];
    
    if (cmps.year > 0) {
        return  [NSString stringWithFormat:@"%ld年前",(long)cmps.year];
    }else if (cmps.month > 0){
        return [NSString stringWithFormat:@"%ld个月前",(long)cmps.month];
    }else if (cmps.day > 0){
        if ([self isYestoday]) {
            return [NSString stringWithFormat:@"昨天"];
        }else{
            return [NSString stringWithFormat:@"%ld天前",(long)cmps.day];
        }
    }else if (cmps.hour > 0){
        return [NSString stringWithFormat:@"%ld小时前",(long)cmps.hour];
    }else if (cmps.minute > 0){
        return [NSString stringWithFormat:@"%ld分钟前",(long)cmps.minute];
    }else{
        return [NSString stringWithFormat:@"%ld秒前",(long)cmps.second];
    }
}

- (NSDateComponents *)deltaFrom:(NSDate *)date{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *compas = [calendar components:unit fromDate:self toDate:date options:0];
    
    return compas;
}



- (BOOL)isThisYear{
    
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear == selfYear;
}

// 第一种方法
//- (BOOL)isToday{
//    // 日历
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
//    NSDateComponents *nowComp = [calendar components:unit fromDate:[NSDate date]];
//    NSDateComponents *selfComp = [calendar components:unit fromDate:self];

//    return nowComp.year == selfComp.year
//    && nowComp.month == selfComp.month
//    && nowComp.day == selfComp.day;
//}

// 第二种方法
- (BOOL)isToday{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *nowString = [formatter stringFromDate:[NSDate date]];
    NSString *selfString = [formatter stringFromDate:self];
    return nowString == selfString;
}


- (BOOL)isYestoday{
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    NSDate *selfDate = [self dateWithYMD];
    // 获得nowDate和selfDate的差距、
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}


- (NSDate *)dateWithYMD{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *selfString = [formatter stringFromDate:self];
    return [formatter dateFromString:selfString];
}



@end
