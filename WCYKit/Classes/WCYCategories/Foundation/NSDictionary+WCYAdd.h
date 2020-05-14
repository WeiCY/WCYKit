//
//  NSDictionary+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 为NSDictionary添加的扩展
 */
@interface NSDictionary (WCYAdd)

/**
 返回BOOL判断是否含有某个key

 @param key 需判断的key
 @return 是否含有
 */
- (BOOL)containsObjectForKey:(id)key;

/**
 是否为空
 
 @return 返回是否是空
 */
- (BOOL)isEmpty;

+ (NSString *)convertToJsonData:(NSDictionary *)dict;
@end
