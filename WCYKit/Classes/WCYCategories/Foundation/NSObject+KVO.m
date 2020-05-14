//
//  NSObject+KVO.m
//  WalletTest
//
//  Created by wcy on 2018/9/17.
//  Copyright © 2018年 wcy. All rights reserved.
//

#import "NSObject+KVO.h"

@implementation NSObject (KVO)

- (void)bindKeyPath:(NSString *)keyPath object:(id)obj block:(bindingBlock)block {
    NSDictionary *dic = @{@"keypath":keyPath, @"block":block};
    
    [obj addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:(__bridge_retained void *)(dic)];
}

-(void)bindKeyPath:(NSString *)keyPath block:(bindingBlock)block
{
    NSDictionary *dic = @{@"keypath":keyPath, @"block":block};
    
    [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:(__bridge_retained void *)(dic)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSDictionary *dic = (__bridge NSDictionary *)(context);
    if (dic) {
        id newobj = change[@"new"];
        
        ((bindingBlock)dic[@"block"])(newobj);
    }
    
    
}

@end
