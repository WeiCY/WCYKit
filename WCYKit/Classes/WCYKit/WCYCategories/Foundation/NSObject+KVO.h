//
//  NSObject+KVO.h
//  WalletTest
//
//  Created by wcy on 2018/9/17.
//  Copyright © 2018年 wcy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ bindingBlock)(id newObj);

@interface NSObject (KVO)

/**
 *  属性变化绑定
 *
 *  @param keyPath 对象的属性
 *  @param obj     要被观察的对象
 *  @param block   block
 */

- (void)bindKeyPath:(NSString *)keyPath object:(id)obj block:(bindingBlock)block;

- (void)bindKeyPath:(NSString *)keyPath block:(bindingBlock)block;

@end
