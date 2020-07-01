//
//  UIView+WCYCorners.m
//  HttpDemo
//
//  Created by 汇元 on 2018/5/21.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "UIView+WCYCorners.h"

@implementation UIView (WCYCorners)

- (void)useBezierPathClipCornerWithType:(UILayoutCornerRadiusType)cornerType WithCornerRadius:(CGFloat)cornerRadius {
    
    [self makeCornerWithMaskPath:[self getBezierPathWithUILayoutCornerType:cornerType WithCornerRadius:cornerRadius]];
}

- (void)useBezierPathClipCornerWithType:(UILayoutCornerRadiusType)cornerType WithCornerRadius:(CGFloat)cornerRadius WithColor:(UIColor *)color withBorderWidth:(CGFloat)width{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = [[self getBezierPathWithUILayoutCornerType:cornerType WithCornerRadius:cornerRadius] CGPath];
    shapeLayer.lineWidth = width;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    
    [self useBezierPathClipCornerWithType:cornerType WithCornerRadius:cornerRadius];
}

#pragma mark - 添加边框
- (void)useCALayerMakeBorderLineWithColor:(UIColor *)color borderWidth:(CGFloat)width {
    self.layer.borderColor = color.CGColor;//设置边框颜色
    self.layer.borderWidth = width;//设置边框颜色
}

#pragma mark - 私有处理方法
- (UIBezierPath *)getBezierPathWithUILayoutCornerType:(UILayoutCornerRadiusType)cornerType WithCornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *maskPath;
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    
    switch (cornerType) {
            // 四个角全切
        case UILayoutCornerRadiusAll:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:UIRectCornerAllCorners
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 三个角
        case UILayoutCornerRadiusExceptTopLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusExceptTopRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusExceptBottomLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerTopLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusExceptBottomRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 两个角
        case UILayoutCornerRadiusTop:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusBottom:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 一个角
        case UILayoutCornerRadiusTopLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusTopRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusBottomLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusBottomRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 对角线
        case UILayoutCornerRadiusTopLeftToBottomRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case UILayoutCornerRadiusTopRightToBottomLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        default: {
            
        }
            break;
            
    }
    
    return maskPath;
}

- (void)makeCornerWithMaskPath:(UIBezierPath *)maskPath {
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


@end
