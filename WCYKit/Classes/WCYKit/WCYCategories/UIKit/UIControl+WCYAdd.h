//
//  UIControl+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/6/26.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIControl的扩展
 UIControl是UIbutton的父类
 主要是为UIbutton提供一些方法
 */
@interface UIControl (WCYAdd)

/**
 删除特定事件的所有操作
 */
- (void)removeAllTargets;

/**
 为特定事件(或事件)添加或替换操作
 
 @param target  对象
 
 @param action   操作
 
 @param controlEvents  点击类型
 */
- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

/**
 将特定事件(或事件)的块添加到内部block。
 它将引起对@a块的强引用。
 
 @param block   操作
 
 @param controlEvents  点击类型
 */
- (void)addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

/**
 向内部添加或替换特定事件(或事件)的block
 它将导致对@a块的强引用。

 
 @param block   操作
 
 @param controlEvents  点击类型
 */
- (void)setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

/**
 删除特定事件的所有block
 
 @param controlEvents  点击类型
 */
- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

/**
 设置特定控件事件(或事件)的声音

 @param name 该方法在应用程序的主包中查找具有指定名称的映像
 注意名称要写全
 @param controlEvent 方式
 */
- (void)setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent;

@end
