//
//  WCYWeChatActionSheet.h
//  MyCategories
//
//  Created by wcy on 2018/9/13.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 仿微信ActionSheet
 */

typedef void(^WCYWeChatActionSheetClickAtIndexBlock)(NSInteger buttonIndex);

@interface WCYWeChatActionSheet : UIView

@property (nonatomic, copy)     NSString *title;
@property (nonatomic, assign)   NSInteger redButtonIndex;
@property (nonatomic, copy)     WCYWeChatActionSheetClickAtIndexBlock clickAtIndexBlock;
@property (nonatomic, copy)     NSString *cancelText; // 默认是取消
@property (nonatomic, strong)   UIFont *textFont; // 字体大小，默认18
@property (nonatomic, strong)   UIColor *textColor; // 字体颜色，默认黑色

/**
 *  返回一个 ActionSheet 对象, 类方法
 *
 *  @param title                    提示标题
 *  @param buttonTitles             所有按钮的标题
 *  @param redButtonIndex           红色按钮的index
 *  @param clickAtIndexBlock        点击按钮的 block 回调
 *
 *  如果没有红色按钮, redButtonIndex 给 "-1" 即可
 
 demo：
 // 选择相机相册 仿微信
 [[WCYWeChatActionSheet sheetWithTitle:nil buttonTitles:@[@"拍照",@"从手机相册选择"] redButtonIndex:-1 clickAtIndexBlock:^(NSInteger buttonIndex) {
     NSLog(@"%zi",buttonIndex);
 }] show];
 
 // 退出登录 仿微信
 [[WCYWeChatActionSheet sheetWithTitle:@"退出后不会删除任何历史数据，下次登录依然可以使用本账号。" buttonTitles:@[@"退出登录"] redButtonIndex:0 clickAtIndexBlock:^(NSInteger buttonIndex) {
 NSLog(@"%zi",buttonIndex);
 }] show];
 
 */
+ (instancetype)sheetWithTitle:(NSString *)title
                  buttonTitles:(NSArray *)buttonTitles
                redButtonIndex:(NSInteger)redButtonIndex
             clickAtIndexBlock:(WCYWeChatActionSheetClickAtIndexBlock)clickAtIndexBlock;

/**
 *  显示 ActionSheet
 */
- (void)show;

@end
