//
//  WCYTool.h
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 自用工具类
 */
@interface WCYTool : NSObject

+ (WCYTool *_Nonnull)sharedManager;
/**
 获取当前控制器

 @return UIViewController
 */
+ (UIViewController *_Nonnull)wcy_getCurrentVC;

#pragma mark - 打开 App Store
/**
 在App Store打开应用

 @param appId 应用id
 @return yes 能打开 no不能打开
 */
+ (BOOL)wcy_openAppStoreWithAppId:(NSString *__nonnull)appId;


/**
 在App Store打开应用评论页面

 @param appid 应用id
 @return yes 能打开 no不能打开
 */
+ (BOOL)wcy_openAPPCommenWithAppId:(NSString *__nonnull)appid;

#pragma mark - 打开设置
/**
 打开系统设置首页
 
 iOS10以上不允许跳转各个设置页面
 example：打开蓝牙会报错
 -canOpenURL: failed for URL: "prefs:root=Bluetooth" - error: "The operation couldn’t be completed. (OSStatus error -10814.)"
 
 发现iOS10后使用下面方法已经不行了，查阅各种文档，只有老外说的这么一句话，
 
 You can use UIApplicationOpenSettingsURLString
 to open your own app's settings (this has been available since iOS 8) but any other prefs:
 URL is now considered a private API and use will result in app rejection.
 
 意思就是苹果已经不允许app跳到各个设置页面了

 */
+ (void)wcy_openSystemSettingHomeViewController;

#pragma mark - QQ相关
/**
 *  是否有安装QQ客户端(请在info.plist文件中 将QQ(mqq)添加到白名单)
 *
 *  设置方法:在info.plist添加LSApplicationQueriesSchemes 类型Array 2.添加一个 item 值设为:mqq
 *
 *  @return BOOL
 */
+ (BOOL)wcy_isHaveQQ;

/**
 *  发起QQ临时会话
 *
 *  @param QQ 开通QQ推广的QQ号码
 
 开通QQ推广方法:
 1.打开QQ推广网址http://shang.qq.com并用QQ登录
 2.点击顶部导航栏:推广工具
 3.在弹出菜单中点击'立即免费开通'
 */
+ (void)wcy_chatWithQQ:(NSString *__nonnull)QQ;

/**
 通过企点QQ链接 来打开客服聊天

 @param link l通过企点QQ生成的链接
 
 生成方法：
 1.打开企点QQ链接https://qidian.qq.com并用QQ登录
 2.进入设置 生成链接 （详细的等有了企点QQ后会补充，之前的账号已经忘了）
 */
+ (void)wcy_chatWithEnterpriseQQLink:(NSString *_Nonnull)link;

#pragma mark - 拨打电话
/**
 拨打电话

 @param phoneNumber 电话号码
 */
+ (void)wcy_telWithPhoneNumber:(NSString *_Nonnull)phoneNumber;

#pragma mark - 打开链接 跳转safari

/**
 打开链接

 @param urlStr 需要用Safari打开的url
 */
+ (void)wcy_gotoSafariBrowserWithURL:(NSString *_Nonnull)urlStr;

#pragma mark - 判断设备是否有摄像头
/// 是否有摄像头 UIDevice扩展中包含 后期调整
+ (BOOL)wcy_isCameraAvailable;

#pragma mark - 根据字符串生产控制器
+ (UIViewController*_Nullable)stringChangeToClass:(NSString *_Nonnull)str;

#pragma mark - 获取上午/下午
+ (NSString*_Nonnull)getCurrentTimeInterval;

#pragma mark - 计算缓存
// 显示缓存大小
- (CGFloat)calculateCacheSize;
// 清理缓存
- (void)clearAllCacheEndClearBlock:(void(^_Nonnull)(BOOL isSuccess))block;

@end
