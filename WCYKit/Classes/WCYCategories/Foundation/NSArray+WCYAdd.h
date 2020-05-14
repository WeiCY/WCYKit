//
//  NSArray+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/6/27.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 为NSArray添加的扩展
 
 原本打算是添加一些修改数组的方法，类似NSMutableArray，后来一想没有什么作用，还容易让别人误解，就不添加了。
 */
@interface NSArray (WCYAdd)

/**
 返回位于随机索引处的对象。
 
 如果数组为空，则返回nil。
 */
- (nullable id)randomObject;

/**
 返回位于索引处的对象，或在越界时返回nil

 @param index 索引
 @return 对象或者nil
 */
- (id _Nullable )safeObjectAtIndex:(NSUInteger)index;

/**
 是否为空

 @return 返回是否是空
 */
- (BOOL)isEmpty;

@end

/**
 为NSMutableArray添加的扩展
 */
@interface NSMutableArray (WCYAdd)

/**
 删除数组中值索引为0的对象。
 如果数组为空，则此方法无效。
 
 @discussion Apple 已经实现了这个方法，但是没有公开。
 覆盖安全。
 */
- (void)removeFirstObject;

/**
 在数组的末尾插入一个给定的对象。
 
 @param anObject Object将对象添加到数组内容的末尾。
 这个值不能是nil。如果anObject为nil，则抛出NSInvalidArgumentException。
 */
- (void)appendObject:(id _Nonnull )anObject;

/**
 在数组的开头插入一个给定的对象。
 
 @param anObject Object将对象添加到数组内容的开头。
 这个值不能是nil。如果anObject为nil，则抛出NSInvalidArgumentException。
 */
- (void)prependObject:(id _Nonnull )anObject;

/**
 将包含在另一个给定数组中的对象添加到接收的数组的末尾。
 
 @param objects 将对象数组添加到接收数组的末尾
 如果对象为空或nil，则此方法无效。
 */
- (void)appendObjects:(NSArray *_Nullable)objects;

/**
 将包含在另一个给定数组中的对象添加到接收的数组的开头。
 
 @param objects 将对象数组添加到接收数组的开头
 如果对象为空或nil，则此方法无效。
 */
- (void)prependObjects:(NSArray *_Nullable)objects;

/**
 将包含在另一个给定数组中的对象添加到接收的索引中。
 
 @param objects 向接收数组添加的对象数组
 如果对象为空或nil，则此方法无效。
 
 @param index 要插入对象的数组中的索引。
 这个值必须不大于数组中元素的计数。如果索引大于数组中元素的数量，则会出现NSRangeException。
 */
- (void)insertObjects:(NSArray *_Nullable)objects atIndex:(NSUInteger)index;

/**
 倒序输出数组
 Example: Before @[ @1, @2, @3 ], After @[ @3, @2, @1 ].
 */
- (void)reverse;

@end
