//
//  UIColor+WCYAdd.h
//  HttpDemo
//
//  Created by 汇元 on 2018/5/18.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIColor类的扩展方法
 */
@interface UIColor (WCYAdd)

/**
 生成随机颜色，并返回

 @return 随机颜色
 */
+ (UIColor *)randomColor;

/**
 根据16进制取颜色
 支持@“#123456”、 @“0X123456”、 @“123456”三种格式

 @param color 16进制数
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
