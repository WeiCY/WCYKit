//
//  NSNotificationCenter+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (WCYAdd)

/**
 将一个给定的通知发送到主线程上的接收方。
 如果当前线程是主线程，则通知被同步发布;
 否则,发布异步交流。

 @param notification 发布的通知。
 如果通知为nil，则会引发异常。
 */
- (void)postNotificationOnMainThread:(NSNotification *_Nonnull)notification;

/**
 将一个给定的通知发送到主线程上的接收方。

 @param notification 发布的通知
 如果通知为nil，则会引发异常。
 @param wait 一个布尔值，指定当前线程是否阻塞
 直到指定的通知被发送给主线程的接收器。
 指定YES来阻止它线程;否则，指定NO以立即返回此方法
 */
- (void)postNotificationOnMainThread:(NSNotification *_Nonnull)notification
                       waitUntilDone:(BOOL)wait;

/**
 创建具有给定名称和通知携带对象的通知并将其发布给在主线程的接受方。
 如果当前线程是主线程，则通知被同步发布;
 否则,发布异步交流。

 @param name 通知的名称。
 @param object 通知携带的对象
 */
- (void)postNotificationOnMainThreadWithName:(NSString *_Nonnull)name
                                      object:(nullable id)object;

/**
 创建具有给定名称、通知携带对象和通知携带的用户信息的通知并将其发布给在主线程的接受方。
 如果当前线程是主线程，则通知被同步发布;
 否则,发布异步交流。

 @param name 通知的名称。
 @param object 通知携带的对象
 @param userInfo 通知携带的用户信息
 */
- (void)postNotificationOnMainThreadWithName:(NSString *_Nonnull)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo;

/**
 创建具有给定名称、通知携带对象和通知携带的用户信息的通知并将其发布给在主线程的接受方。
 如果当前线程是主线程，则通知被同步发布;
 否则,发布异步交流。

 @param name 通知的名称。
 @param object 通知携带的对象
 @param userInfo 通知携带的用户信息
 @param wait 一个布尔值，指定当前线程是否阻塞
 直到指定的通知被发送给主线程的接收器。
 指定YES来阻止它线程;否则，指定NO以立即返回此方法
 */
- (void)postNotificationOnMainThreadWithName:(NSString *_Nonnull)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo
                               waitUntilDone:(BOOL)wait;

@end
