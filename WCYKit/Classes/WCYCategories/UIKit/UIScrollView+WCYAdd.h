//
//  UIScrollView+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/6/25.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIScrollView的扩展类
 主要提供滑动在一侧的方法
 */
@interface UIScrollView (WCYAdd)

/**
 滑动到顶部（默认带动画）
 */
- (void)scrollToTop;

/**
 滑动到底部（默认带动画）
 */
- (void)scrollToBottom;

/**
 滑动到左边（默认带动画）
 */
- (void)scrollToLeft;

/**
 滑动到右边（默认带动画）
 */
- (void)scrollToRight;

/**
 滑动到顶部
 
 @param animated  是否带动画
 */
- (void)scrollToTopAnimated:(BOOL)animated;

/**
 滑动到底部
 
 @param animated  是否带动画
 */
- (void)scrollToBottomAnimated:(BOOL)animated;

/**
 滑动到左边
 
 @param animated  是否带动画
 */
- (void)scrollToLeftAnimated:(BOOL)animated;

/**
 滑动到右边
 
 @param animated  是否带动画
 */
- (void)scrollToRightAnimated:(BOOL)animated;

@end
