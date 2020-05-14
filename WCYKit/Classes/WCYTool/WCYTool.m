//
//  WCYTool.m
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "WCYTool.h"

@implementation WCYTool

+ (WCYTool *)sharedManager{
    static WCYTool *mytool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mytool = [[self alloc] init];
    });
    return mytool;
}

#pragma mark --------------------获取当前控制器
+ (UIViewController *)wcy_getCurrentVC{
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for (UIWindow *tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    UIViewController *viewController = window.rootViewController;
    UIViewController *currentVC = nil;
    while (viewController) {
        currentVC = viewController;
        //控制器
        if ([viewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tempVC = (UITabBarController *)viewController;
            viewController = tempVC.selectedViewController;
        }else if ([viewController isKindOfClass:[UINavigationController class]]){
            UINavigationController *tempVC = (UINavigationController *)viewController;
            viewController = [tempVC.viewControllers lastObject];
        }else{
            viewController = viewController.presentedViewController;
        }
    }
    
    return currentVC;
}

#pragma mark - 打开App Store
+ (BOOL)wcy_openAppStoreWithAppId:(NSString *)appId {
    
    NSString *urlPath = [@"itms-apps://itunes.apple.com/cn/app/id" stringByAppendingString:appId];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlPath]];
    
}

+ (BOOL)wcy_openAPPCommenWithAppId:(NSString *)appid {
    
    NSString *str = [NSString stringWithFormat:
                     @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",
                     appid];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}

#pragma mark - 打开设置首页
+ (void)wcy_openSystemSettingHomeViewController {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

#pragma mark - QQ相关
+ (BOOL)wcy_isHaveQQ {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]];
}

+ (void)wcy_chatWithQQ:(NSString *)QQ {
    NSString *url = [NSString stringWithFormat:@"http://wpa.b.qq.com/cgi/wpa.php?ln=2&uin=%@", QQ];
    
    // http://wpa.b.qq.com/cgi/wpa.php?ln=2&uin=4007201188
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

+ (void)wcy_chatWithEnterpriseQQLink:(NSString *)link {
    // http://q.url.cn/abHLaT?_type=wpa&qidian=true
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:link]];
}

#pragma mark - 拨打电话
+ (void)wcy_telWithPhoneNumber:(NSString *)phoneNumber {
    // 拨打电话的几种方法 请详看我的博客----iOS 拨打电话（解决openURL延迟和不同方法比较）[https://www.cnblogs.com/weicyNo-1/p/7151605.html]
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString: phoneNumber]]];
}

#pragma mark - 打开链接
+ (void)wcy_gotoSafariBrowserWithURL:(NSString *)urlStr {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}

#pragma mark - 判断设备是否有摄像头
+ (BOOL)wcy_isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

#pragma mark - 根据字符串生产控制器
+ (UIViewController*)stringChangeToClass:(NSString *)str {
    
    id vc = [[NSClassFromString(str) alloc]init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

#pragma mark - 获取上午/下午
+ (NSString*)getCurrentTimeInterval {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH"];
    NSString *str = [formatter stringFromDate:[NSDate date]];
    int time = [str intValue];
    if (time >= 18 || time <= 06) {
        return @"晚上";
    } else if (time > 06 && time <= 12) {
        return @"上午";
    } else {
        return @"下午";
    }
}

#pragma mark - 计算缓存
// 显示缓存大小
- (CGFloat)calculateCacheSize {
    NSString *cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    return [self folderSizeAtPath:cachPath];
}


//1:首先我们计算一下 单个文件的大小
- (long long)fileSizeAtPath:(NSString *)filePath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if ([manager fileExistsAtPath :filePath]){
        
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize ];
    }
    
    return 0 ;
    
}

//2:遍历文件夹获得文件夹大小，返回多少 M（提示：你可以在工程界设置（)m）
- (CGFloat)folderSizeAtPath:( NSString *) folderPath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    
    NSString * fileName;
    
    long long folderSize = 0 ;
    
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
        
    }
    
    return folderSize/( 1024.0 * 1024.0 );
}

// 清理缓存
- (void)clearAllCacheEndClearBlock:(void(^)(BOOL isSuccess))block {
    NSString *cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    NSArray *files = [[ NSFileManager defaultManager ] subpathsAtPath :cachPath];
    
    NSLog (@"cachpath = %@",cachPath);
    for (NSString *p in files) {
        
        NSError *error = nil ;
        
        NSString *path = [cachPath stringByAppendingPathComponent :p];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath :path]) {
            [[NSFileManager defaultManager] removeItemAtPath :path error :&error];
        }
        
        if (error) {
            block(NO);
            return;
        }
    }
    
    block(YES);
    
}

@end
