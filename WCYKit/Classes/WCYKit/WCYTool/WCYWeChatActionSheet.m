//
//  WCYWeChatActionSheet.m
//  MyCategories
//
//  Created by wcy on 2018/9/13.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "WCYWeChatActionSheet.h"

static CGFloat const WCActionSheetDefaultFontSize = 18.0;
static CGFloat const WCActionSheetDefaulButtonHeight = 49.0;

@interface WCYWeChatActionSheet ()

@property (nonatomic, strong) NSMutableArray *buttonTitles; //所有按钮的标题
@property (nonatomic, strong) UIView *darkView;  //蒙版
@property (nonatomic, strong) UIView *bottomView; //所有按钮的底部View
@property (nonatomic, strong) UIWindow *backWindow;

@end

@implementation WCYWeChatActionSheet

#pragma mark - Init Methods
+ (instancetype)sheetWithTitle:(NSString *)title
                  buttonTitles:(NSArray *)buttonTitles
                redButtonIndex:(NSInteger)redButtonIndex
             clickAtIndexBlock:(WCYWeChatActionSheetClickAtIndexBlock)clickAtIndexBlock{
    return [[self alloc] initWithTitle:title buttonTitles:buttonTitles redButtonIndex:redButtonIndex clickAtIndexBlock:clickAtIndexBlock];
}

- (instancetype)initWithTitle:(NSString *)title
                 buttonTitles:(NSArray *)buttonTitles
               redButtonIndex:(NSInteger)redButtonIndex
            clickAtIndexBlock:(WCYWeChatActionSheetClickAtIndexBlock)clickAtIndexBlock{
    self=[super init];
    
    if (self){
        self.title = title;
        self.buttonTitles = [[NSMutableArray alloc] initWithArray:buttonTitles];
        self.redButtonIndex = redButtonIndex;
        self.clickAtIndexBlock = clickAtIndexBlock;
    }
    
    return self;
}

#pragma mark - Show Methods
- (void)show {
    [self setupMainView];
    self.backWindow.hidden = NO;
    
    [self addSubview:self.bottomView];
    [self.backWindow addSubview:self];
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.darkView.alpha=0.3f;
        self.darkView.userInteractionEnabled=YES;
        
        CGRect frame = self.bottomView.frame;
        frame.origin.y -= CGRectGetHeight(frame);
        self.bottomView.frame=frame;
        
    } completion:nil];
}

- (void)setupMainView {
    
    // 蒙版
    UIView *darkView = [[UIView alloc] init];
    darkView.alpha=0;
    darkView.userInteractionEnabled=NO;
    darkView.frame=(CGRect){0, 0,[UIScreen mainScreen].bounds.size};
    darkView.backgroundColor=[UIColor colorWithRed:46/255.0 green:49/255.0 blue:50/255.0 alpha:1.0];
    [self addSubview:darkView];
    self.darkView = darkView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    [darkView addGestureRecognizer:tap];
    
    // 所有按钮的底部view
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:238/255.0 alpha:1.0];
    self.bottomView = bottomView;
    
    CGFloat verticalSpace = 0;
    
    if (self.title) {
        
        CGSize titleSize = [self.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}];
        //最多两行，当两行时高度加15
        if (titleSize.width>CGRectGetWidth([UIScreen mainScreen].bounds)-30.0f) {
            verticalSpace = 15.0f;
        }
        
        UIView *titleBackgroundView = [[UIView alloc] init];
        titleBackgroundView.backgroundColor = [UIColor whiteColor];
        titleBackgroundView.frame = CGRectMake(0, 0,CGRectGetWidth([UIScreen mainScreen].bounds), WCActionSheetDefaulButtonHeight + verticalSpace);
        [bottomView addSubview:titleBackgroundView];
        
        // 标题
        UILabel *label = [[UILabel alloc] init];
        label.text=self.title;
        label.numberOfLines=2;
        label.textColor=[UIColor colorWithRed:111/255.0 green:111/255.0 blue:111/255.0 alpha:1.0];
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont systemFontOfSize:13.0];
        label.backgroundColor=[UIColor whiteColor];
        label.frame=CGRectMake(15.0f, 0, CGRectGetWidth([UIScreen mainScreen].bounds)-30.0f, CGRectGetHeight(titleBackgroundView.frame));
        [titleBackgroundView addSubview:label];
    }
    
    if(self.buttonTitles.count) {
        
        //添加button
        for (int i=0; i<self.buttonTitles.count; i++) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.tag=i;
            button.backgroundColor=[UIColor whiteColor];
            [button setTitle:self.buttonTitles[i] forState:UIControlStateNormal];
            button.titleLabel.font=self.textFont;
            
            UIColor *titleColor=nil;
            if (i==self.redButtonIndex) {
                titleColor=[UIColor colorWithRed:255/255.0 green:10/255.0 blue:10/255.0 alpha:1.0];
            }else{
                titleColor=self.textColor;
            }
            [button setTitleColor:titleColor forState:UIControlStateNormal];
            
            [button setBackgroundImage:[self getImageWithColor:[UIColor colorWithRed:233/255.0 green:233/255.0 blue:238/255.0 alpha:0.3] WithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), WCActionSheetDefaulButtonHeight)] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
            
            CGFloat buttonY=WCActionSheetDefaulButtonHeight*(i+(self.title ? 1:0))+verticalSpace;
            button.frame=CGRectMake(0, buttonY, CGRectGetWidth([UIScreen mainScreen].bounds), WCActionSheetDefaulButtonHeight);
            [bottomView addSubview:button];
        }
        
        //添加线条
        for (int i=0; i<self.buttonTitles.count; i++) {
            UIView *lineView=[[UIView alloc] init];
            lineView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:238/255.0 alpha:1.0];
            
            CGFloat lineY=WCActionSheetDefaulButtonHeight*(i+(self.title ? 1:0))+verticalSpace;
            lineView.frame=CGRectMake(0, lineY, CGRectGetWidth([UIScreen mainScreen].bounds), 1.0f);
            [bottomView addSubview:lineView];
        }
    }
    
    UIButton *cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.tag=self.buttonTitles.count;
    cancelButton.backgroundColor=[UIColor whiteColor];
    [cancelButton setTitle:self.cancelText forState:UIControlStateNormal];
    cancelButton.titleLabel.font=self.textFont;
    [cancelButton setTitleColor:self.textColor forState:UIControlStateNormal];
    [cancelButton setBackgroundImage:[self getImageWithColor:[UIColor colorWithRed:233/255.0 green:233/255.0 blue:238/255.0 alpha:0.3] WithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), WCActionSheetDefaulButtonHeight)] forState:UIControlStateHighlighted];
    [cancelButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat cancelButtonY = WCActionSheetDefaulButtonHeight * (self.buttonTitles.count + (self.title ? 1 : 0)) + 5.0f+verticalSpace;
    cancelButton.frame=CGRectMake(0, cancelButtonY, CGRectGetWidth([UIScreen mainScreen].bounds), WCActionSheetDefaulButtonHeight);
    [bottomView addSubview:cancelButton];
    
    CGFloat bottomViewHeight = (self.title ? WCActionSheetDefaulButtonHeight : 0) + WCActionSheetDefaulButtonHeight * self.buttonTitles.count + WCActionSheetDefaulButtonHeight + 5.0f+verticalSpace;
    bottomView.frame=CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds), CGRectGetWidth([UIScreen mainScreen].bounds), bottomViewHeight);
    
    self.frame=(CGRect){0, 0,[UIScreen mainScreen].bounds.size};
}

#pragma mark - Dissmiss Methods
- (void)dismiss:(UITapGestureRecognizer *)tap {
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.darkView.alpha=0;
        self.darkView.userInteractionEnabled=NO;
        
        CGRect frame = self.bottomView.frame;
        frame.origin.y += CGRectGetHeight(frame);
        self.bottomView.frame=frame;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        self.backWindow.hidden = YES;
    }];
}

#pragma mark - Button Methods
- (void)didClickButton:(UIButton *)button{
    [self dismiss:nil];
    self.clickAtIndexBlock(button.tag);
}

#pragma mark - Common Methods
- (UIImage *)getImageWithColor:(UIColor *)color WithSize:(CGSize)size {
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark - Getter Methods
- (NSString *)cancelText{
    
    if (_cancelText) {
        return _cancelText;
    }
    
    _cancelText = @"取消";
    return _cancelText;
}

- (UIFont *)textFont{
    
    if (_textFont) {
        return _textFont;
    }
    
    _textFont =[UIFont systemFontOfSize:WCActionSheetDefaultFontSize];
    
    return _textFont;
}

- (UIColor *)textColor{
    
    if (_textColor) {
        return _textColor;
    }
    
    _textColor = [UIColor blackColor];
    return _textColor;
}

- (UIWindow *)backWindow {
    
    if (!_backWindow) {
        _backWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backWindow.windowLevel       = UIWindowLevelStatusBar;
        _backWindow.backgroundColor   = [UIColor clearColor];
        _backWindow.hidden = NO;
    }
    
    return _backWindow;
}
@end
