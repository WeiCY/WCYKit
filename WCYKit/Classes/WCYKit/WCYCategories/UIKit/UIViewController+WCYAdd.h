//
//  UIViewController+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/7/3.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 为UIViewController添加的扩展
 */
@interface UIViewController (WCYAdd)

/**
 是否含有子控制器

 @return 是否含有
 */
- (BOOL)hasChildViewController;

@end
