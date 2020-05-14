//
//  UILabel+WCYChangeLineSpaceAndWordSpace.h
//  ZheLiXing
//
//  Created by CityDoWCY on 2020/3/17.
//  Copyright © 2020 CityDoWCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 改变UIlabel 间距
@interface UILabel (WCYChangeLineSpaceAndWordSpace)

/**
 *  改变行间距
 */
+ (void)wcy_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)wcy_changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)wcy_changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


@end

NS_ASSUME_NONNULL_END
