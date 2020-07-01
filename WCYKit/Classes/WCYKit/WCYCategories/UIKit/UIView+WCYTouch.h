//
//  UIView+WCYTouch.h
//  MyCategories
//
//  Created by 汇元 on 2018/6/26.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIView的扩展方法
 主要为UIView及其子类添加点击长按方法
 */
typedef void(^touchAction)(void);

#define UIView_Addtion_TouchAction @"UIView_Addtion_TouchAction"
#define UIView_Addtion_LongTouchAction @"UIView_Addtion_LongTouchAction"
#define UIView_Addtion_LongTouchAction1 @"UIView_Addtion_LongTouchAction1"

@interface UIView (WCYTouch)

/**
 为UIView类及其子类添加点击
 
 @param action 处理点击的block
 */
- (void)setTouchAction:(void(^)(UIView *view))action;

/**
 为UIView类及其子类添加长按
 
 @param action 处理点击的block
 @param finishAction 长按结束时的处理  一般不写 会调用多次
 */
- (void)setLongTouchAction:(void(^)(UIView *view))action finishOrCancelAction:(void(^)(UIView *view))finishAction;

@end
