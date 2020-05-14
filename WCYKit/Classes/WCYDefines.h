//
//  WCYDefines.h
//  iOSAll
//
//  Created by 汇元 on 2018/5/29.
//  Copyright © 2018年 汇元. All rights reserved.
//

#ifndef WCYDefines_h
#define WCYDefines_h

/**
 设备信息
 */
#define DEVICE_USERNAME        [[UIDevice currentDevice] name]
#define DEVICE_SYSTEMNAME      [[UIDevice currentDevice] systemName]
#define DEVICE_VESION          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DEVICE_IPHONEORPAD     [[UIDevice currentDevice ] userInterfaceIdiom]
#define DEVICE_ISIPAD          (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 APP应用信息
 */
#define APP_DELEGATE           ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define APP_VERSION            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_NAME               [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/**
 系统控件默认高度
 */
//状态栏高度
#define STATUSBAR_HEIGHT        [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAVGATIONBAR_HEIGHT     (44.f)
//整个导航栏高度
#define TopNavHeight (STATUSBAR_HEIGHT + NAVGATIONBAR_HEIGHT)
//整个导航栏高度
#define TABBAR_HEIGHT           ([[UIApplication sharedApplication] statusBarFrame].size.height>20.f?83.f:49.f)

/**
 设备屏幕宽度和高度
 */
#define EQUIPMENT_SCREENT_WIDTH   CGRectGetWidth([[UIScreen mainScreen] bounds])
#define EQUIPMENT_SCREENT_HEIGHT  CGRectGetHeight([[UIScreen mainScreen] bounds])

/**
 用户记录是否第一次进入应用
 */
#define FIRSTSTART @"FirstStart"
#define USERFIRSTAPPVERSION @"UserFirstAppVersion"

/**
 用户登录存储
 */
#define USERLOGIN_CACHE @"UserLoginCache"

/**
 默认基础颜色字体设置
 */
// 主题色
#define PUBlIC_COLOR [UIColor colorWithHexString:@"F23535"]
// 视图背景颜色
#define VIEW_BACKGROUNDCOLOR [UIColor colorWithHexString:@"F4F4F4"]
// 分割线颜色
#define LineColor [UIColor colorWithHexString:@"E9E9E9"]
// 文字颜色
#define TextColor [UIColor colorWithHexString:@"121212"]
// info颜色
#define SubTextColor [UIColor colorWithHexString:@"B2B2B2"]
// 额外颜色 在APP迭代中可能会有多种颜色
#define OtherGrayColor [UIColor colorWithHexString:@"888888"]
#define OrderDetailSubColor [UIColor colorWithHexString:@"000000"]


/**
 导航栏宏定义设置
 */
// 导航栏title文字颜色
#define NAV_TITLE_COLOR [UIColor whiteColor]
// 导航栏title文字字体
#define NAV_TITLE_FONT [UIFont systemFontOfSize:17.0]
// 导航栏背景颜色
#define NAV_BACKGROUND_COLOR PUBlIC_COLOR
// 导航栏返回按钮图片
#define NAV_LEFTBUTTON [UIImage imageNamed:@"nav_left"]
#define NAV_LEFTBUTTON_WHITE [UIImage imageNamed:@"nav_left_white"]


/**
 TabBar宏定义
 */
// tabBar背景颜色
#define TAB_BACKGROUND_COLOR [UIColor whiteColor]
// tabBar文字颜色
#define TABBAR_TITLE_COLOR [UIColor colorWithHexString:@"888888"]
// tabBar文字选中颜色
#define TABBAR_SELECTED_TITLE_COLOR [UIColor colorWithHexString:@"23535"]
// tabBar文字字体
#define TABBAR_TITLEFONT [UIFont systemFontOfSize:11]

/**
 简写rgb颜色

 @param r 红色
 @param g 绿色
 @param b 蓝色
 @return 透明度
 */
#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif


/**
 是否是空对象
 */
#define WCYIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


/**
 不同屏幕尺寸、字体适配
 */
#define kScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define kScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
//#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]

/**
 弧度角度转换
 */
//由角度转换弧度
#define DegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define RadianToDegrees(radian) (radian * 180.0) / (M_PI)


/**
 获取类名
 */
#define GET_CLASS_NAME(x) [NSString stringWithUTF8String:object_getClassName([x class])]

/**
 单例
 */
#undef AS_SINGLETON
#define AS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;
#undef DEF_SINGLETON

#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
    return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
    static dispatch_once_t once; \
    static __class * __singleton__; \
    dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
    return __singleton__; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t once; \
    static __class * __singleton__; \
    dispatch_once(&once, ^{ __singleton__ = [super allocWithZone:zone]; } ); \
    return __singleton__; \
}

#endif /* WCYDefines_h */
