//
//  UIButton+WCYButton.m
//  WCYKitDemo
//
//  Created by wcy on 2018/11/17.
//  Copyright © 2018 wcy. All rights reserved.
//

#import "UIButton+WCYButton.h"

@interface WCYButtonPositionCacheManager : NSObject

@property (nonatomic, strong) NSCache *cache;

@end

@implementation WCYButtonPositionCacheManager

+ (instancetype)sharedInstance {
    static WCYButtonPositionCacheManager * _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [[NSCache alloc] init];
    }
    return self;
}

@end


/**
 缓存用数据结构
 */
@interface WCYButtonPositionCacheModel : NSObject
@property (nonatomic, assign) UIEdgeInsets imageEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;
@end

@implementation WCYButtonPositionCacheModel
@end



@implementation UIButton (WCYButton)

- (void)wcy_setImagePosition:(WCYImagePositionType)type spacing:(CGFloat)spacing {
    NSCache *cache = [WCYButtonPositionCacheManager sharedInstance].cache;
    NSString *cacheKey = [NSString stringWithFormat:@"%@_%@_%@", self.currentTitle, @(self.titleLabel.font.hash),@(type)];
    WCYButtonPositionCacheModel *savedModel = [cache objectForKey:cacheKey];
    if (savedModel != nil) {
        self.imageEdgeInsets = savedModel.imageEdgeInsets;
        self.titleEdgeInsets = savedModel.titleEdgeInsets;
        self.contentEdgeInsets = savedModel.contentEdgeInsets;
        return;
    }
    
    CGFloat imageWidth = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // Single line, no wrapping. Truncation based on the NSLineBreakMode.
    CGSize size = [self.currentTitle sizeWithFont:self.titleLabel.font];
    CGFloat labelWidth = size.width;
    CGFloat labelHeight = size.height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    switch (type) {
        case WCYImagePositionTypeLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case WCYImagePositionTypeRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case WCYImagePositionTypeTop:
            imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case WCYImagePositionTypeBottom:
            imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            break;
    }
    
    WCYButtonPositionCacheModel *model = [[WCYButtonPositionCacheModel alloc] init];
    model.imageEdgeInsets = imageEdgeInsets;
    model.titleEdgeInsets = titleEdgeInsets;
    model.contentEdgeInsets = contentEdgeInsets;
    [cache setObject:model forKey:cacheKey];
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
}

@end
