//
//  NSNumber+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/6/27.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 提供一个方法来把‘NSString’转化为‘NSNumber’。
 */
@interface NSNumber (WCYAdd)

/**
 从字符串中创建并返回一个NSNumber对象。
 有效的格式:@“12”@“12.345”@“0 xff”@“.23e99”…

 @param string 数字字符串
 @return 当解析成功时，返回一个NSNumber，如果出现错误，则返回nil。
 */
+ (nullable NSNumber *)numberWithString:(NSString *_Nullable)string;



@end
