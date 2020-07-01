//
//  NSDate+WCYAdd.m
//  MyCategories
//
//  Created by 汇元 on 2018/6/27.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "NSDate+WCYAdd.h"

@implementation NSDate (WCYAdd)

- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (BOOL)isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isSameDateWithDate:(NSDate *)date {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formater stringFromDate:self];
    NSString *dateStr1 = [formater stringFromDate:date];
    return [dateStr isEqualToString:dateStr1];
}

- (NSString *)easyReadPastTimeString {
    NSTimeInterval timeOffset = [[NSDate date] timeIntervalSinceNow] - [self timeIntervalSinceNow];
    if (timeOffset < 0) {
        return @"时间在未来";
    } else if (timeOffset < 60) {
        return @"刚刚";
    } else if (timeOffset < 60 * 60) {
        long min = (long)timeOffset/60;
        return [NSString stringWithFormat:@"%ld分钟前", min];
    } else if (timeOffset < 60 * 60 * 24) {
        long hour = (long)timeOffset/3660;
        return [NSString stringWithFormat:@"%ld小时前", hour];
    } else if (timeOffset < 60 * 60 * 24 * 7) {
        long day = (long)timeOffset/(3600*24);
        return [NSString stringWithFormat:@"%ld天前", day];
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yy-MM-dd hh:mm";
        return [formatter stringFromDate:self];
    }
}

+ (NSString *)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return @"One day is late";
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return @"One day is early";
    }
    //NSLog(@"Both dates are the same");
    return @"It is same time";
}

+ (NSDate *)stringToDate:(NSString *)string {
    
    // 日期格式化类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 设置时间格式
    formatter.dateFormat =@"yyyy/MM/dd HH:mm:ss";
    
    // 字符串转为时间
    NSDate *date = [formatter dateFromString:string];
    
    return date;
}

+ (NSString *)dateToString:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat =@"yyyy-MM-dd";
    /*
     y年 M月 d日
     H（24小时制）时 h(12小时制)时  m分 s秒
     */
    
    // 时间转为字符串
    NSString *str = [formatter stringFromDate:date];
    
    return str;
}

@end
