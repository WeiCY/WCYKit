//
//  NSObject+Addtion.h
//  HttpDemo
//
//  Created by 汇元 on 2018/5/18.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Addtion)

- (void)addPropertyWithKey:(NSString *)key value:(id)value;

- (id)getAddedPropertyValueWithKey:(NSString *)key;

- (void)removeAllAddedProperties;

+ (void)setMethod:(SEL)selector withIMP:(SEL)other;

@end
