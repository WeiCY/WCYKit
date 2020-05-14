//
//  UIImage+WCYAdd.h
//  HttpDemo
//
//  Created by 汇元 on 2018/5/18.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIImage的扩展方法
 */
@interface UIImage (WCYAdd)<NSURLSessionDelegate>

/**
 根据颜色生成图片

 @param color 图片颜色
 @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 根据颜色生成规定尺寸图片

 @param color 图片颜色
 @param size 图片尺寸
 @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

///**
// 颜色渐变
// 颜色渐变方向可以手动修改，见drawLinearGradient方法
//
// @param rect 尺寸
// @param startColor 开始颜色
// @param endColor 结束颜色
// @return 渐变图片
// 已弃用，可以使用UIView+WCYGradient中的方法!!!
// */
//+ (UIImage *)colorGradientWithRect:(CGRect)rect startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 用GIF数据创建一个动画图像

 @param data gif数据
 @param scale 比例
 @return gif image
 */
+ (UIImage *)imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;

/**
 是否含有透明像素
 */
- (BOOL)hasAlphaChannel;

/**
 合并两个图片

 @param firstImage 第一个图片
 @param secondImage 第二个图片
 @return 合并后图片
 */
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

@end
