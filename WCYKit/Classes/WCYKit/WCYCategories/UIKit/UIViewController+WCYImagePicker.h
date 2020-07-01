//
//  UIViewController+WCYImagePicker.h
//  WCYKitDemo
//
//  Created by CityDoWCY on 2020/5/9.
//  Copyright © 2020 wcy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ImagePickerCompletionHandler)(NSData * _Nonnull imageData, UIImage * _Nonnull image);

NS_ASSUME_NONNULL_BEGIN

/// 一行代码调用系统相机相册
@interface UIViewController (WCYImagePicker)

/// 调用相机相册 不带裁剪
/// @param completionHandler 回调会把图片data和image传回去
- (void)wcy_pickImageWithCompletionHandler:(ImagePickerCompletionHandler)completionHandler;

/// 调用相机相册 带裁剪尺寸
/// @param imageSize 图片的尺寸
/// @param completionHandler 回调会把图片data和image传回去
- (void)wcy_pickImageWithpickImageCutImageWithImageSize:(CGSize)imageSize CompletionHandler:(ImagePickerCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
