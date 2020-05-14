//
//  WCYWindowBubble.h
//  MyWeb
//
//  Created by wcy on 2018/11/10.
//  Copyright © 2018 wcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 气泡浮层
 仿照iOS的虚拟按键
 */
@interface WCYWindowBubble : UIView

/**
*  颜色
*/
@property (nonatomic , strong ) UIColor *color;

/**
 *  图片
 */
@property (nonatomic , strong ) UIImage *image;

/**
 *  父视图中可移动范围边距 默认为 0 0 0 0 (气泡默认可活动范围为父视图大小)
 */
@property (nonatomic , assign ) UIEdgeInsets edgeInsets;

/**
 *  点击气泡Block
 */
@property (nonatomic , copy ) void(^clickBubbleBlock)(void);

/**
 *  添加动画
 */
- (void)addAnimations;

@end

NS_ASSUME_NONNULL_END
