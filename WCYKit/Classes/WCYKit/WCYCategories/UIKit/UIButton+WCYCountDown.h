//
//  UIButton+WCYCountDown.h
//  UIButtonTest
//
//  Created by 汇元 on 2018/7/11.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIbutton 倒计时按钮功能
 */
@interface UIButton (WCYCountDown)

/**
 倒计时按钮
 使用时注意此方法只是设置了倒计时功能，倒计时按钮的外观和标题没有设置。
 
 注意：button的type要是custom 如果是system就会出现闪烁问题
 
 @param defaultTitle 默认标题 例如：获取验证码
 @param totalTime 倒计时总时间
 @param unit 倒计时单位 一般为秒 s
 */
- (void)startCountDownWithDefaultTitle:(NSString *)defaultTitle totalTime:(NSInteger)totalTime timeUnit:(NSString *)unit;

@end
