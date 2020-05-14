//
//  UIText+WCYAdd.h
//  WalletTest
//
//  Created by wcy on 2018/9/17.
//  Copyright © 2018年 wcy. All rights reserved.
//


#import <UIKit/UIKit.h>
/**
 为UITextFiled UITextView添加的控制字符长度、判断非空的扩展
 */

@interface UILabel (Text)

@property (nonatomic, readonly) BOOL isTextEmpty;

@end

@interface UITextField (Text)

@property (nonatomic, readonly) BOOL isTextEmpty;

@property (nonatomic, assign) NSInteger textLimitLength;

@end

@interface UITextView (Text)

@property (nonatomic, readonly) BOOL isTextEmpty;

@property (nonatomic, strong) IBInspectable NSString * placeholder;

@property (nonatomic, assign) NSInteger textLimitLength;

@end
