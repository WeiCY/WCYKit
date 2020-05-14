//
//  NSDate+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/6/27.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 为NSDate添加的扩展
 */
@interface NSDate (WCYAdd)

#pragma mark - Component Properties

@property (nonatomic, readonly) NSInteger year; ///< 年 component
@property (nonatomic, readonly) NSInteger month; ///< 月 component (1~12)
@property (nonatomic, readonly) NSInteger day; ///< 日 component (1~31)
@property (nonatomic, readonly) NSInteger hour; ///< 时 component (0~23)
@property (nonatomic, readonly) NSInteger minute; ///< 分 component (0~59)
@property (nonatomic, readonly) NSInteger second; ///< 秒 component (0~59)
@property (nonatomic, readonly) NSInteger weekday; ///< 周几 从周日开始 component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger weekdayOrdinal; ///< 周几 从周日开始 component
@property (nonatomic, readonly) NSInteger weekOfMonth; ///< 月的第几周 component (1~5)
@property (nonatomic, readonly) NSInteger weekOfYear; ///< 年的第几周 component (1~53)

@property (nonatomic, readonly) BOOL isLeapMonth; ///< 月份是否是闰月
@property (nonatomic, readonly) BOOL isLeapYear; ///< 月份是否是闰年
@property (nonatomic, readonly) BOOL isToday; ///< 是不是今天 (based on current locale)

#pragma mark - Other
/**
 判断与时间是否一致

 @param date 判断时间
 @return 1一致 0不一致
 */
- (BOOL)isSameDateWithDate:(NSDate *)date;

/**
 根据时间返回字符串

 @return  <60s 刚刚
          <60Min n分钟前
          <24h n小时前
          <1week n天前
          >1week yy-MM-dd hh:mm
 */
- (NSString *)easyReadPastTimeString;

/**
 判断两个时间的先后

 @param oneDay 第一个时间
 @param anotherDay 第二个时间
 @return  One day is late
          One day is early
          It is same time
 */
+ (NSString *)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

/**
 string转化为date

 @param string 时间字符串
 @return 字符串转化的date
 */
+ (NSDate *)stringToDate:(NSString *)string;

/**
 date转化为string
 
 时间格式自己需要设置
 
 @param date 时间
 @return 转化的字符串
 */
+ (NSString *)dateToString:(NSDate *)date;

@end
