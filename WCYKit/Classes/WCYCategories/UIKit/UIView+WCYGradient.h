//
//  UIView+WCYGradient.h
//  WCYKitDemo
//
//  Created by wcy on 2018/11/10.
//  Copyright © 2018 wcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WCYGradient)

/* The array of CGColorRef objects defining the color of each gradient
 * stop. Defaults to nil. Animatable. */

@property(nullable, copy) NSArray *colors;

/* An optional array of NSNumber objects defining the location of each
 * gradient stop as a value in the range [0,1]. The values must be
 * monotonically increasing. If a nil array is given, the stops are
 * assumed to spread uniformly across the [0,1] range. When rendered,
 * the colors are mapped to the output colorspace before being
 * interpolated. Defaults to nil. Animatable. */

@property(nullable, copy) NSArray<NSNumber *> *locations;

/* The start and end points of the gradient when drawn into the layer's
 * coordinate space. The start point corresponds to the first gradient
 * stop, the end point to the last gradient stop. Both points are
 * defined in a unit coordinate space that is then mapped to the
 * layer's bounds rectangle when drawn. (I.e. [0,0] is the bottom-left
 * corner of the layer, [1,1] is the top-right corner.) The default values
 * are [.5,0] and [.5,1] respectively. Both are animatable. */

@property CGPoint startPoint;
@property CGPoint endPoint;

/**
 生成渐变色UIView

 @param colors 颜色数组
 @param locations 坐标
 @param startPoint 开始点
 @param endPoint 结束点
 
 渐变色的方向其实就是沿着startPoint指向endPoint的方向
 所以(0,0)->(0,1)是从左到右
     (0,0)->(1,0)从上到下
 
 @return 返回渐变色背景的view
 
 example：
 UIView *newView = [UIView gradientViewWithColors:@[[UIColor redColor],[UIColor orangeColor]]  locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
 newView.frame = CGRectMake(100, 300, 100, 100);
 [self.view addSubview:newView];
 
 */
+ (UIView *_Nullable)gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/**
 生成渐变色

 @param colors 颜色数组
 @param locations 坐标
 @param startPoint 开始点
 @param endPoint 结束点
 
 example：
 [label setGradientBackgroundWithColors:@[[UIColor redColor],[UIColor orangeColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
 
 [btn setGradientBackgroundWithColors:@[[UIColor redColor],[UIColor orangeColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
 */
- (void)setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
