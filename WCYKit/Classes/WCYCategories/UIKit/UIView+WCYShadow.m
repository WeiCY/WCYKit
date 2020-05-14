//
//  UIView+WCYShadow.m
//  MyCategories
//
//  Created by wcy on 2018/9/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "UIView+WCYShadow.h"

@implementation UIView (WCYShadow)

- (void)WCYSetShadowWithShadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(WCYShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth {
    
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOffset = CGSizeZero;
    
    CGRect shadowRect;
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat originW = self.bounds.size.width;
    CGFloat originH = self.bounds.size.height;
    
    switch (shadowPathSide) {
        case WCYShadowPathSideTop:
            shadowRect  = CGRectMake(originX, originY - shadowPathWidth/2, originW,  shadowPathWidth);
            break;
            
        case WCYShadowPathSideLeft:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
            
        case WCYShadowPathSideBottom:
            shadowRect  = CGRectMake(originX, originH -shadowPathWidth/2, originW, shadowPathWidth);
            break;
            
        case WCYShadowPathSideRight:
            shadowRect  = CGRectMake(originW - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
            
        case WCYShadowPathSideNoTop:
            shadowRect  = CGRectMake(originX -shadowPathWidth/2, originY +1, originW +shadowPathWidth,originH + shadowPathWidth/2 );
            break;
            
        case WCYShadowPathSideAll:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY - shadowPathWidth/2, originW +  shadowPathWidth, originH + shadowPathWidth);
            break;
            
        default:
            break;
    }
    
    UIBezierPath *path =[UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = path.CGPath;
}

@end
