//
//  UIButton+WCYCountDown.m
//  UIButtonTest
//
//  Created by 汇元 on 2018/7/11.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "UIButton+WCYCountDown.h"
#import "WCYKit-prefix.pch"

@implementation UIButton (WCYCountDown)

- (void)startCountDownWithDefaultTitle:(NSString *)defaultTitle totalTime:(NSInteger)totalTime timeUnit:(NSString *)unit {
    self.userInteractionEnabled = NO;
    
    __block NSInteger totalTimeOut = totalTime-1; // 倒计时时间
    
    dispatch_queue_t queen = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queen);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC); // 每秒执行
    dispatch_source_set_event_handler(timer, ^{
        if (totalTimeOut <= 0) {
            // 倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [self setTitle:defaultTitle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            
            // int minutes = timeout / 60;
            int seconds = totalTimeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
//                NSLog(@"____%@",strTime);
                [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,unit] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                    
            });
            totalTimeOut--;
        }
    });
    dispatch_resume(timer);
}

@end
