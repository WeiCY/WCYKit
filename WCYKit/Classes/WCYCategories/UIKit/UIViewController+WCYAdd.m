//
//  UIViewController+WCYAdd.m
//  MyCategories
//
//  Created by 汇元 on 2018/7/3.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "UIViewController+WCYAdd.h"

@implementation UIViewController (WCYAdd)

- (BOOL)hasChildViewController {
    return [self.childViewControllers count] > 0;
}

@end
