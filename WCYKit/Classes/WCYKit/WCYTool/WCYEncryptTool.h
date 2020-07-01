//
//  WCYEncryptTool.h
//  Pods-WCYKit_Example
//
//  Created by CityDoWCY on 2020/7/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 字符串加密展示工具
@interface WCYEncryptTool : NSObject

#pragma mark - 隐藏姓名

/// 姓名加密 隐藏前面 只留最后一个
/// @param name 需要加密的姓名
+ (NSString *)wcy_encryptNameFront:(NSString *)name;

/// 姓名加密 隐藏前面 只留第一个
/// @param name 需要加密的姓名
+ (NSString *)wcy_encryptNameBack:(NSString *)name;


/// 手机号加密 中间四位加密
/// @param mobile 需要加密的手机号
+ (NSString *)wcy_encryptMobile:(NSString *)mobile;

/// 字符串加密
/// @param string 需要加密字符串
/// @param range 需要替换的range
+ (NSString *)wcy_encryptString:(NSString *)string range:(NSRange)range;

/// 字符串加密
/// @param string 需要加密字符串
/// @param encryChar 加密样式 单字符
/// @param range 需要替换的range
+ (NSString *)wcy_encryptString:(NSString *)string encryStr:(NSString *)encryChar range:(NSRange)range;


@end

NS_ASSUME_NONNULL_END
