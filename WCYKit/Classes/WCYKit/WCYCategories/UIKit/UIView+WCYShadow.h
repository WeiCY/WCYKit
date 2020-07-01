//
//  UIView+WCYShadow.h
//  MyCategories
//
//  Created by wcy on 2018/9/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WCYShadowPathSide){
    WCYShadowPathSideLeft = 0,
    WCYShadowPathSideTop,
    WCYShadowPathSideRight,
    WCYShadowPathSideBottom,
    WCYShadowPathSideNoTop,
    WCYShadowPathSideAll
};

/**
 为UIview及其子类添加阴影
 
 在开发中我们常遇到带阴影的视图，一般情况是弄图片，但是有时还是需要我们自己手动添加阴影。
 为了方便，我添加了这个扩展。
 */
@interface UIView (WCYShadow)

/**
 添加阴影

 @param shadowColor 阴影颜色
 @param shadowOpacity 阴影透明度 0-1
 @param shadowRadius 阴影半径 
 @param shadowPathSide 阴影位置
 @param shadowPathWidth 阴影宽度
 */
- (void)WCYSetShadowWithShadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(WCYShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth;

@end
