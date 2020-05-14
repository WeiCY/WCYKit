//
//  UIButton+WCYBadge.h
//  UIButtonTest
//
//  Created by 汇元 on 2018/7/11.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIButton 添加通知数字
 
 原版摘自：https://github.com/mikeMTOL/UIBarButtonItem-Badge
 原版问题，如果先设置button.badgeValue，后设置button.shouldHideBadgeAtZero就会出现0也显示。虽然在开发中一般不会出现这个情况，毕竟都是先进行设置属性，最后在网络设置value。
 
 e.g 设置badge
 button.shouldHideBadgeAtZero = YES;
 button.badgeValue = @"0";
 
 */
@interface UIButton (WCYBadge)

@property (strong, nonatomic) UILabel *badge;

// Badge value to be display
@property (nonatomic) NSString *badgeValue;
// Badge background color
@property (nonatomic) UIColor *badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *badgeTextColor;
// Badge font
@property (nonatomic) UIFont *badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat badgeOriginX;
@property (nonatomic) CGFloat badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL shouldAnimateBadge;

@end
