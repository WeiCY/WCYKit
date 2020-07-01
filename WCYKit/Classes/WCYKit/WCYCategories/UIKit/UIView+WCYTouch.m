//
//  UIView+WCYTouch.m
//  MyCategories
//
//  Created by 汇元 on 2018/6/26.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "UIView+WCYTouch.h"
#import "NSObject+Addtion.h"

@implementation UIView (WCYTouch)

- (void (^)(UIView *view))touchAction {
    return [self getAddedPropertyValueWithKey:UIView_Addtion_TouchAction];
}

- (void)setTouchAction:(void(^)(UIView *view))action {
    [self addPropertyWithKey:UIView_Addtion_TouchAction value:action];
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        [self removeGestureRecognizer:gesture];
    }
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    [self addGestureRecognizer:gesture];
}

- (void)tapGesture {
    if ([self touchAction]) {
        [self touchAction](self);
    }
}

- (void (^)(UIView *view))longTouchAction {
    return [self getAddedPropertyValueWithKey:UIView_Addtion_LongTouchAction];
}

- (void (^)(UIView *view))longTouchFinishAction {
    return [self getAddedPropertyValueWithKey:UIView_Addtion_LongTouchAction1];
}

- (void)setLongTouchAction:(void(^)(UIView *view))action finishOrCancelAction:(void(^)(UIView *view))finishAction {
    [self addPropertyWithKey:UIView_Addtion_LongTouchAction value:action];
    [self addPropertyWithKey:UIView_Addtion_LongTouchAction1 value:finishAction];
    
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTouchAction:)];
    [self addGestureRecognizer:gesture];
}

- (void)longTouchAction:(UIGestureRecognizer *)ges {
    if (ges.state == UIGestureRecognizerStateBegan) {
        if ([self longTouchAction]) {
            [self longTouchAction](self);
        }
    } else {
        if ([self longTouchFinishAction]) {
            [self longTouchFinishAction](self);
        }
    }
}

@end
