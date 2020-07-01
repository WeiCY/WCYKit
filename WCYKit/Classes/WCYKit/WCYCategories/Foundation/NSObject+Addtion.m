//
//  NSObject+Addtion.m
//  HttpDemo
//
//  Created by 汇元 on 2018/5/18.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "NSObject+Addtion.h"
#import <objc/runtime.h>

@implementation NSObject (Addtion)

- (void)addPropertyWithKey:(NSString *)key value:(id)value {
    objc_setAssociatedObject(self, [key cStringUsingEncoding:NSUTF8StringEncoding], value, OBJC_ASSOCIATION_RETAIN);
}
- (id)getAddedPropertyValueWithKey:(NSString *)key {
    return objc_getAssociatedObject(self, [key cStringUsingEncoding:NSUTF8StringEncoding]);
}
- (void)removeAllAddedProperties {
    objc_removeAssociatedObjects(self);
}

+ (void)setMethod:(SEL)selector withIMP:(SEL)other {
    Method md = class_getClassMethod([self class], selector);
    BOOL isClass = YES;
    if (!md) {
        md = class_getInstanceMethod([self class], selector);
        isClass = NO;
    }
    
    IMP imp = isClass?[[self class] methodForSelector:other]:[[self class] instanceMethodForSelector:other];//判断是不是class方法很重要，否则会失败
    if (md && imp) {
        method_setImplementation(md, imp);
    }
}

@end
