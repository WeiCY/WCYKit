//
//  UIImage+CompressImage.h
//  testHtml
//
//  Created by wcy on 2018/10/20.
//  Copyright © 2018 wcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CompressImage)

/**
 压缩图片

 @param sourceImage 原图片
 @return 压缩后的图片
 */
+ (UIImage *)compressImageWithOriginalImage:(UIImage *)sourceImage;

/**
 计算tUIImage的大小

 @param image 需计算的图片
 */
+ (void)calulateImageFileSize:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
