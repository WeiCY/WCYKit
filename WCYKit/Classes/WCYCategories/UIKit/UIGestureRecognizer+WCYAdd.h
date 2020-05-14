//
//  UIGestureRecognizer+WCYAdd.h
//  YYCategoriesDemo
//
//  Created by 汇元 on 2018/6/26.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIGestureRecognizer的扩展方法
 主要是为手势直接添加手势回调
 */
@interface UIGestureRecognizer (WCYAdd)

/**
 手势直接显示回调

 @param block 处理该操作块识别的block
 @return 返回一个具体的UIGestureRecognizer子类的初始化实例
 */
- (instancetype)initWithActionBlock:(void (^)(id sender))block;

/**
 向手势识别器对象添加操作块

 @param block 处理该操作块识别的block
 */
- (void)addActionBlock:(void (^)(id sender))block;

/**
 移除所有操作
 */
- (void)removeAllActionBlocks;

@end
