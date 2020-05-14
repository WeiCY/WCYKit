//
//  UIButton+WCYButton.h
//  WCYKitDemo
//
//  Created by wcy on 2018/11/17.
//  Copyright © 2018 wcy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WCYImagePositionType) {
    WCYImagePositionTypeLeft = 0, //图片在左，文字在右，默认
    WCYImagePositionTypeRight,    //图片在右，文字在左
    WCYImagePositionTypeTop,      //图片在上，文字在下
    WCYImagePositionTypeBottom,   //图片在下，文字在上
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (WCYButton)

/**
 设置图片文字按钮的图片位置
 参考：https://github.com/Phelthas/Demo_ButtonImageTitleEdgeInsets

 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 
 @param type 图片位置类型
 @param spacing 图片和文字的间隔
 */
- (void)wcy_setImagePosition:(WCYImagePositionType)type spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
