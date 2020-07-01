//
//  UIImage+CompressImage.m
//  testHtml
//
//  Created by wcy on 2018/10/20.
//  Copyright © 2018 wcy. All rights reserved.
//

#import "UIImage+CompressImage.h"

@implementation UIImage (CompressImage)

/**  压缩图片*/
+ (UIImage *)compressImageWithOriginalImage:(UIImage *)sourceImage{
        //进行图像尺寸的压缩
        CGSize imageSize = sourceImage.size;//取出要压缩的image尺寸
        CGFloat width = imageSize.width;    //图片宽度
        CGFloat height = imageSize.height;  //图片高度
        //1.宽高大于1280(宽高比不按照2来算，按照1来算)
        if (width>1280||height>1280) {
            if (width>height) {
                CGFloat scale = height/width;
                width = 1280;
                height = width*scale;
            }else{
                CGFloat scale = width/height;
                height = 1280;
                width = height*scale;
            }
            //2.宽大于1280高小于1280
        }else if(width>1280||height<1280){
            CGFloat scale = height/width;
            width = 1280;
            height = width*scale;
            //3.宽小于1280高大于1280
        }else if(width<1280||height>1280){
            CGFloat scale = width/height;
            height = 1280;
            width = height*scale;
            //4.宽高都小于1280
        }else{
            
        }
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
        [sourceImage drawInRect:CGRectMake(0,0,width,height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //进行图像的画面质量压缩
        NSData *data=UIImageJPEGRepresentation(newImage, 1.0);
        if (data.length>100*1024) {
            if (data.length>1024*1024) {//1M以及以上
                data=UIImageJPEGRepresentation(newImage, 0.4);
            }else if (data.length>512*1024) {//0.5M-1M
                data=UIImageJPEGRepresentation(newImage, 0.5);
            }else if (data.length>200*1024) {
                //0.25M-0.5M
                data=UIImageJPEGRepresentation(newImage, 0.9);
            }
        }
    return [UIImage imageWithData:data];
}

// 计算图片大小
+ (void)calulateImageFileSize:(UIImage *)image {
    NSData *data = UIImagePNGRepresentation(image);
    if (!data) {
        data = UIImageJPEGRepresentation(image, 1.0);//需要改成0.5才接近原图片大小，原因请看下文
    }
    double dataLength = [data length] * 1.0;
    NSArray *typeArray = @[@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB",@"ZB",@"YB"];
    NSInteger index = 0;
    while (dataLength > 1024) {
        dataLength /= 1024.0;
        index ++;
    }
    NSLog(@"image = %.3f %@",dataLength,typeArray[index]);
}

@end
