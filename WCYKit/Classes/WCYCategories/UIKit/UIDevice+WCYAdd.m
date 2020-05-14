//
//  UIDevice+WCYAdd.m
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "UIDevice+WCYAdd.h"
#import "NSString+WCYAdd.h"

@implementation UIDevice (WCYAdd)

+ (double)systemVersion {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}

- (BOOL)isPad {
    static dispatch_once_t one;
    static BOOL pad;
    dispatch_once(&one, ^{
        pad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    });
    return pad;
}

- (BOOL)isSimulator {
    static dispatch_once_t one;
    static BOOL simu;
    dispatch_once(&one, ^{
        simu = NSNotFound != [[self model] rangeOfString:@"Simulator"].location;
    });
    return simu;
}

- (BOOL)isJailbroken {
    if ([self isSimulator]) return NO; // Dont't check simulator
    
    // iOS9 URL Scheme query changed ...
    // NSURL *cydiaURL = [NSURL URLWithString:@"cydia://package"];
    // if ([[UIApplication sharedApplication] canOpenURL:cydiaURL]) return YES;
    
    NSArray *paths = @[@"/Applications/Cydia.app",
                       @"/private/var/lib/apt/",
                       @"/private/var/lib/cydia",
                       @"/private/var/stash"];
    for (NSString *path in paths) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) return YES;
    }
    
    FILE *bash = fopen("/bin/bash", "r");
    if (bash != NULL) {
        fclose(bash);
        return YES;
    }
    
    NSString *path = [NSString stringWithFormat:@"/private/%@", [NSString stringWithUUID]];
    if ([@"test" writeToFile : path atomically : YES encoding : NSUTF8StringEncoding error : NULL]) {
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        return YES;
    }
    
    return NO;
}

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
- (BOOL)canMakePhoneCalls {
    __block BOOL can;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        can = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
    });
    return can;
}
#endif

- (BOOL)isHasCamera {
     return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (NSDate *)systemUptime {
    NSTimeInterval time = [[NSProcessInfo processInfo] systemUptime];
    return [[NSDate alloc] initWithTimeIntervalSinceNow:(0 - time)];
}

@end
