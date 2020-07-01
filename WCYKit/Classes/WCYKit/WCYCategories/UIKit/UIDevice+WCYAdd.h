//
//  UIDevice+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (WCYAdd)
/// 设备系统版本 (e.g. 8.1)
+ (double)systemVersion;

/// 设备是否是iPad
@property (nonatomic, readonly) BOOL isPad;

/// 设备是不是模拟器.
@property (nonatomic, readonly) BOOL isSimulator;

/// 设备是否越狱.
@property (nonatomic, readonly) BOOL isJailbroken;

/// 设备是否可以打电话
@property (nonatomic, readonly) BOOL canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");

/// The System's startup time.
@property (nonatomic, readonly) NSDate *systemUptime;

/// 设备是否有摄像头
@property (nonatomic, readonly) BOOL isHasCamera;

@end
