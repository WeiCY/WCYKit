//
//  UIView+WCYCorners.h
//  HttpDemo
//
//  Created by 汇元 on 2018/5/21.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIView的扩展类
 主要提供贝塞尔曲线切割圆角的方法
 */
typedef NS_ENUM(NSInteger, UILayoutCornerRadiusType) {
    // 全部角都切圆角
    UILayoutCornerRadiusAll = 0,
   
    // 切三个角
    UILayoutCornerRadiusExceptTopLeft = 1,
    UILayoutCornerRadiusExceptTopRight = 2,
    UILayoutCornerRadiusExceptBottomLeft = 3,
    UILayoutCornerRadiusExceptBottomRight = 4,
    
    // 切两个角（同一边）
    UILayoutCornerRadiusTop = 5,
    UILayoutCornerRadiusLeft = 6,
    UILayoutCornerRadiusRight = 7,
    UILayoutCornerRadiusBottom = 8,
    
    // 切一个角
    UILayoutCornerRadiusTopLeft = 9,
    UILayoutCornerRadiusTopRight = 10,
    UILayoutCornerRadiusBottomLeft = 11,
    UILayoutCornerRadiusBottomRight = 12,
    
    // 对角线
    UILayoutCornerRadiusTopLeftToBottomRight = 13,
    UILayoutCornerRadiusTopRightToBottomLeft = 14,
};

@interface UIView (WCYCorners)

/**
 切割圆角方法

 @param cornerType 切割类型
 @param cornerRadius 切割角度
 */
- (void)useBezierPathClipCornerWithType:(UILayoutCornerRadiusType)cornerType WithCornerRadius:(CGFloat)cornerRadius;

/**
 切割圆角方法和添加边框

 @param cornerType 切割类型
 @param cornerRadius 切割角度
 @param color 颜色 例：[UIColor BlackColor] 方法里会转成CGColor
 @param width 宽度 例：1.0f
 
 */
- (void)useBezierPathClipCornerWithType:(UILayoutCornerRadiusType)cornerType WithCornerRadius:(CGFloat)cornerRadius WithColor:(UIColor *)color withBorderWidth:(CGFloat)width;

/**
 添加边框
 使用CALayer添加边框 可以做到不切割圆角加线
 
 @param color 颜色 例：[UIColor BlackColor] 方法里会转成CGColor
 @param width 宽度 例：1.0f
 */
- (void)useCALayerMakeBorderLineWithColor:(UIColor *)color borderWidth:(CGFloat)width;

@end
