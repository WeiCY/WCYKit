//
//  UIText+WCYAdd.m
//  WalletTest
//
//  Created by wcy on 2018/9/17.
//  Copyright © 2018年 wcy. All rights reserved.
//

#import "UIText+WCYAdd.h"
#import <objc/runtime.h>
#import "UIColor+WCYAdd.h"
#import "NSObject+KVO.h"
#import "WCYDefines.h"
#import "UIView+WCYFrame.h"

@implementation UILabel (Text)

@dynamic isTextEmpty;

- (BOOL)isTextEmpty {
    return WCYIsEmpty(self.text);
}

@end

@implementation UITextField (Text)

@dynamic isTextEmpty;

- (BOOL)isTextEmpty {
    return WCYIsEmpty(self.text);
}

- (NSInteger)textLimitLength {
    return ((NSNumber *)objc_getAssociatedObject(self, _cmd)).integerValue;
}

- (void)setTextLimitLength:(NSInteger)textLimitLength {
    objc_setAssociatedObject(self, @selector(textLimitLength), @(textLimitLength), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (textLimitLength > 0) {
        [self addTarget:self action:@selector(changed:) forControlEvents:UIControlEventValueChanged];
        
        [self addTarget:self action:@selector(changed:) forControlEvents:UIControlEventEditingChanged];
    }
}

- (void)changed:(id)sender {
    if (self.text.length > self.textLimitLength) {
        self.text = [self.text substringToIndex:self.textLimitLength];
    }
}

@end

@implementation UITextView (Text)

@dynamic isTextEmpty;

- (BOOL)isTextEmpty {
    return WCYIsEmpty(self.text);
}


- (NSInteger)textLimitLength {
    return ((NSNumber *)objc_getAssociatedObject(self, _cmd)).integerValue;
}

- (void)setTextLimitLength:(NSInteger)textLimitLength {
    objc_setAssociatedObject(self, @selector(textLimitLength), @(textLimitLength), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changed:) name:UITextViewTextDidChangeNotification object:self];
    
    UILabel * textLabel = [[UILabel alloc]init];
    textLabel.textColor = [UIColor colorWithHexString:@"909090"];
    textLabel.font = [UIFont systemFontOfSize:12];
    textLabel.tag = 110;
    
    
    textLabel.width=self.width -20;
    textLabel.height= 15;
    textLabel.left=10;
    textLabel.top=self.height- textLabel.height -5;
    
    textLabel.textAlignment=NSTextAlignmentRight;
    textLabel .text= [NSString stringWithFormat:@"0/%ld",(long)self.textLimitLength];
    
    [self addSubview:textLabel];
        
    [self bindKeyPath:@"contentOffset" object:self block:^(id newObj) {
        textLabel.top=self.contentOffset.y+self.height- textLabel.height -5;
    }];
    
}

- (void)changed:(id)sender {
    if (self.textLimitLength>0) {
        if (self.text.length > self.textLimitLength) {
            self.text = [self.text substringToIndex:self.textLimitLength];
        }
        
        for (UIView * view  in self.subviews) {
            if (view.tag ==110) {
                UILabel * label =  ((UILabel *) view );
                
                label .text= [NSString stringWithFormat:@"%lu/%ld",(unsigned long)self.text.length,(long)self.textLimitLength];
            }
        }
    }
    
}

#pragma mark - update
- (void)updatePlaceHolder{
    if (self.text.length>0) {
        [self.zw_placeHolderLabel removeFromSuperview];
        return;
    }
    self.zw_placeHolderLabel.font = self.font;
    self.zw_placeHolderLabel.textAlignment = self.textAlignment;
    [self.zw_placeHolderLabel sizeToFit];
    self.zw_placeHolderLabel.left = 10;
    
    [self insertSubview:self.zw_placeHolderLabel atIndex:0];
}
#pragma mark - lazzing
-(UILabel *)zw_placeHolderLabel{
    UILabel *placeHolderLab = objc_getAssociatedObject(self, @selector(zw_placeHolderLabel));
    if (!placeHolderLab) {
        placeHolderLab = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(zw_placeHolderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}

-(NSString *)placeholder
{
    return  [self zw_placeHolderLabel].text;
}

-(void)setPlaceholder:(NSString *)placeholder
{
    self.textContainerInset = UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, 5.0f);
    self.contentInset=UIEdgeInsetsMake(10, 0, 20.0f, 0);
    
    UILabel * label = [self zw_placeHolderLabel];
    label.text= placeholder;
    [self updatePlaceHolder];
}

@end
