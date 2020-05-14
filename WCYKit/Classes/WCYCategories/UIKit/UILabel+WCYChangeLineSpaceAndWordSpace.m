//
//  UILabel+WCYChangeLineSpaceAndWordSpace.m
//  ZheLiXing
//
//  Created by CityDoWCY on 2020/3/17.
//  Copyright © 2020 CityDoWCY. All rights reserved.
//

#import "UILabel+WCYChangeLineSpaceAndWordSpace.h"

@implementation UILabel (WCYChangeLineSpaceAndWordSpace)

+ (void)wcy_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

+ (void)wcy_changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

+ (void)wcy_changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

@end
