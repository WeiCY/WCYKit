//
//  NSDictionary+WCYAdd.m
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "NSDictionary+WCYAdd.h"

@implementation NSDictionary (WCYAdd)

- (BOOL)containsObjectForKey:(id)key {
    if (!key) return NO;
    return self[key] != nil;
}

- (BOOL)isEmpty {
    return [self count] == 0 ? YES : NO;
}

// 字典转json
+ (NSString *)convertToJsonData:(NSDictionary *)dict {
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
@end
