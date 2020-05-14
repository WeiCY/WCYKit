//
//  WCYDataPicker.m
//  MyXueBei
//
//  Created by wcy on 2018/9/20.
//  Copyright © 2018年 wcy. All rights reserved.
//

#import "WCYDataPicker.h"

#define WCYDataToolBarHeight 44
#define WCYPickerViewHeight 216
#define WCYDataPickerHeight 260

typedef NS_ENUM(NSInteger, WCYDataPickerType) {
    WCYDataPickerTypeSingleColumn           = 0, //单列选择器
    WCYDataPickerTypeRelatedColumns         = 1, //相关联多列选择，eg.(第二列数据依赖第一列选择结果)
    WCYDataPickerTypeUnrelatedColumns       = 2  //相关联多列选择，eg.(第二列数据依赖第一列选择结果)
};

@interface WCYDataPicker()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIPickerView *pickerView; //选择器

//选择器列数
@property (nonatomic, assign) NSInteger numberOfComponents;

// 单列选择器
@property (nonatomic, copy) WCYDataPickerSingleSelected singleBlock;
@property (nonatomic, strong) NSArray *singleDataSource;
@property (nonatomic, assign) NSInteger singleSelectIndex;
// 多列选择器
@property (nonatomic, copy) WCYDataPickerMultiSelected multiBlock;
@property (nonatomic, strong) NSMutableDictionary *multiDataSources;  //包含数据字典
@property (nonatomic, strong) NSMutableDictionary *multiSelectIndexs;
//
@property (nonatomic, assign) WCYDataPickerType type;                //数据选择器类型
@property (nonatomic, assign) id<WCYDataPickerDelegate> delegate;    // 默认是nil，弱引用

@end

@implementation WCYDataPicker

- (instancetype)init {
    if (self = [super init]) {
        self.type = WCYDataPickerTypeSingleColumn;
        self.delegate = nil;
        
        self.numberOfComponents = 0;
        
        self.singleDataSource = [NSArray array];
        self.singleSelectIndex = 0;
        self.multiDataSources = [NSMutableDictionary dictionary];
        self.multiSelectIndexs = [NSMutableDictionary dictionary];
        
        CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
        //CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
        self.frame = CGRectMake(0, 0, screenWidth, WCYDataPickerHeight);
        self.backgroundColor = [UIColor whiteColor];
        
        //标题
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.frame = CGRectMake(70, 0, screenWidth - 70 * 2, WCYDataToolBarHeight);
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont systemFontOfSize:17.0];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        //取消按钮
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBtn.frame = CGRectMake(10, 5, 55, 35);
        self.cancelBtn.backgroundColor = [UIColor clearColor];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self.cancelBtn setTitleColor:[UIColor blackColor]
                             forState:UIControlStateNormal];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self
                           action:@selector(cancelButtonAction:)
                 forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelBtn];
        
        //确定按钮
        self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.confirmBtn.frame = CGRectMake(screenWidth - 10 - 55, 5, 55, 35);
        self.confirmBtn.backgroundColor = [UIColor clearColor];
        self.confirmBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self.confirmBtn setTitleColor:[UIColor blackColor]
                              forState:UIControlStateNormal];
        [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.confirmBtn addTarget:self
                            action:@selector(confirmButtonAction:)
                  forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.confirmBtn];
        
        //分割线
        UIView *seporatorLine = [[UIView alloc]init];
        seporatorLine.frame = CGRectMake(0, WCYDataToolBarHeight, screenWidth, 0.5);
        seporatorLine.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
        [self addSubview:seporatorLine];
        
        //选择器
        self.pickerView = [[UIPickerView alloc] init];
        self.pickerView.frame = CGRectMake(0, WCYDataToolBarHeight, screenWidth, WCYPickerViewHeight);
        self.pickerView.backgroundColor = [UIColor clearColor];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        self.pickerView.showsSelectionIndicator = YES;
        [self addSubview:self.pickerView];
    }
    
    return self;
}

#pragma mark - Private Methods
- (void)show {
    
    //阴影
    self.shadowView = [[UIView alloc] init];
    self.shadowView.frame = [UIScreen mainScreen].bounds;
    self.shadowView.backgroundColor = [UIColor blackColor];
    self.shadowView.alpha = 0.5;
    
    UIWindow *windowKey = [UIApplication sharedApplication].keyWindow;
    [windowKey addSubview:self.shadowView];
    [windowKey addSubview:self];
    
    self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.frame.size.width, self.frame.size.height);
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - WCYDataPickerHeight, self.frame.size.width, self.frame.size.height);
    }];
}

- (void)dismiss {
    //隐藏
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self.shadowView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)cancelButtonAction:(id)sender {
    [self dismiss];
}

- (void)confirmButtonAction:(id)sender {
    if (self.type == WCYDataPickerTypeSingleColumn) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(dataPicker:selectedSingleIndex:selectedSingleContent:)]) {
            NSString *selectContent = self.singleDataSource[self.singleSelectIndex];
            [self.delegate dataPicker:self selectedSingleIndex:self.singleSelectIndex selectedSingleContent:selectContent];
        }
        self.singleBlock(self.singleSelectIndex, self.singleDataSource[self.singleSelectIndex]);
    } else if (self.type == WCYDataPickerTypeRelatedColumns ||
              self.type == WCYDataPickerTypeUnrelatedColumns) {  //多列选择类型
        NSMutableDictionary *selectContentDic = [NSMutableDictionary dictionary];
        for (NSUInteger idx = 0; idx < self.multiSelectIndexs.count; idx++) {
            NSNumber *selectIndex = [self.multiSelectIndexs objectForKey:[NSNumber numberWithInteger:idx]];
            NSArray *dataSource = [self.multiDataSources objectForKey:[NSNumber numberWithUnsignedInteger:idx]];
            NSString *selectContent = dataSource[[selectIndex integerValue]];
            [selectContentDic setObject:selectContent forKey:[NSNumber numberWithUnsignedInteger:idx]];
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(dataPicker:selectedMultiIndexs:selectedMultiContents:)]) {
            // 从数据源和选中行中获取选中数据
            [self.delegate dataPicker:self selectedMultiIndexs:self.multiSelectIndexs selectedMultiContents:selectContentDic];
        }
        self.multiBlock(self.multiSelectIndexs, selectContentDic);
    } else {
        // do nothing
    }
    
    [self dismiss];
}

#pragma mark - Public Methods
+ (WCYDataPicker *)dataPicker {
    return [[[self class] alloc] init];
}

- (void)showSingleDataPickerWithTitle:(NSString *)title
                             delegate:(id)delegate
                           dataSource:(NSArray *)source
                        selectedIndex:(NSInteger)index
                        completeBlock:(WCYDataPickerSingleSelected)block {
    self.titleLabel.text = title;
    self.type = WCYDataPickerTypeSingleColumn;
    self.delegate = delegate;
    self.numberOfComponents = 1;
    self.singleDataSource = source;
    self.singleSelectIndex = index;
    self.singleBlock = block;
    
    if (self.singleSelectIndex > self.singleDataSource.count - 1) {
        self.singleSelectIndex = 0;
    }
    [self.pickerView selectRow:self.singleSelectIndex inComponent:0 animated:YES];
    
    [self show];
}

- (void)showMultiReletedDataPickerWithTitle:(NSString *)title
                                   delegate:(id)delegate
                               numOfColumns:(NSInteger)columns
                             selectedIndexs:(NSDictionary *)indexs
                              completeBlock:(WCYDataPickerMultiSelected)block {
    self.titleLabel.text = title;
    self.type = WCYDataPickerTypeRelatedColumns;
    self.delegate = delegate;
    self.numberOfComponents = columns;
    for (NSUInteger idx = 0; idx < self.numberOfComponents; idx++) {
        [self.multiSelectIndexs setObject:[NSNumber numberWithInteger:0] forKey:[NSNumber numberWithUnsignedInteger:idx]];
    }
    
    if (indexs) {   //已经有选中行
        self.multiSelectIndexs = [NSMutableDictionary dictionaryWithDictionary:indexs];
    }
    
    self.multiBlock = block;
    
    for (NSUInteger idx = 0; idx < self.multiSelectIndexs.count; idx++) {
        NSNumber *selectIndex = [self.multiSelectIndexs objectForKey:[NSNumber numberWithUnsignedInteger:idx]];
        [self.pickerView selectRow:[selectIndex integerValue] inComponent:idx animated:NO];
    }
    
    [self show];
}

- (void)showMultiUnRelatedDataPickerWithTitle:(NSString *)title
                                     delegate:(id)delegate
                                 numOfColumns:(NSInteger)columns
                               selectedIndexs:(NSDictionary *)indexs
                                completeBlock:(WCYDataPickerMultiSelected)block {
    self.titleLabel.text = title;
    self.type = WCYDataPickerTypeUnrelatedColumns;
    self.delegate = delegate;
    self.numberOfComponents = columns;
    for (NSUInteger idx = 0; idx < self.numberOfComponents; idx++) {
        [self.multiSelectIndexs setObject:[NSNumber numberWithInteger:0] forKey:[NSNumber numberWithUnsignedInteger:idx]];
    }
    
    if (indexs) {   //已经有选中行
        self.multiSelectIndexs = [NSMutableDictionary dictionaryWithDictionary:indexs];
    }
    
    self.multiBlock = block;
    
    for (NSUInteger idx = 0; idx < self.multiSelectIndexs.count; idx++) {
        NSNumber *selectIndex = [self.multiSelectIndexs objectForKey:[NSNumber numberWithUnsignedInteger:idx]];
        [self.pickerView selectRow:[selectIndex integerValue] inComponent:idx animated:NO];
    }
    
    [self show];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.type == WCYDataPickerTypeSingleColumn) { // 单列选择器
        return self.numberOfComponents;
    } else if (self.type == WCYDataPickerTypeRelatedColumns){   // 相关多列选择
        return self.numberOfComponents;
    } else if (self.type == WCYDataPickerTypeUnrelatedColumns){ // 不相关多列选择
        return self.numberOfComponents;
    }
    
    return self.numberOfComponents;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.type == WCYDataPickerTypeSingleColumn) { // 单列选择器
        if (self.delegate && [self.delegate respondsToSelector:@selector(dataPicker:dataSourceInColumn:)]) {
            // 根据回调方法传入数据
            self.singleDataSource = [self.delegate dataPicker:self dataSourceInColumn:component];
            return self.singleDataSource.count;
        } else {
            return self.singleDataSource.count;
        }
    } else if (self.type == WCYDataPickerTypeRelatedColumns){ // 相关多列选择
        if (self.delegate && [self.delegate respondsToSelector:@selector(dataPicker:dataSourceInColumn:)]) {
            NSArray *dataSource = [self.delegate dataPicker:self dataSourceInColumn:component];
            [self.multiDataSources setObject:dataSource forKey:[NSNumber numberWithInteger:component]];
            return dataSource.count;
        } else {
            return 0;
        }
    } else if (self.type == WCYDataPickerTypeUnrelatedColumns){ // 不相关多列选择
        if (self.delegate && [self.delegate respondsToSelector:@selector(dataPicker:dataSourceInColumn:)]) {
            NSArray *dataSource = [self.delegate dataPicker:self dataSourceInColumn:component];
            [self.multiDataSources setObject:dataSource forKey:[NSNumber numberWithInteger:component]];
            return dataSource.count;
        } else {
            return 0;
        }
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.type == WCYDataPickerTypeSingleColumn) {
        return row < self.singleDataSource.count ? self.singleDataSource[row] : @"";
    } else if (self.type == WCYDataPickerTypeRelatedColumns){ // 不相关多列选择
        NSArray *dataSource = [self.multiDataSources objectForKey:[NSNumber numberWithInteger:component]];
        return (row < [dataSource count]) ? dataSource[row] : @"";
    } else if (self.type == WCYDataPickerTypeUnrelatedColumns){ // 不相关多列选择
        NSArray *dataSource = [self.multiDataSources objectForKey:[NSNumber numberWithInteger:component]];
        return (row < [dataSource count]) ? dataSource[row] : @"";
    }
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.type == WCYDataPickerTypeSingleColumn) {
        self.singleSelectIndex = row;
    } else if (self.type == WCYDataPickerTypeRelatedColumns){ // 不相关多列选择
        [self.multiSelectIndexs setObject:[NSNumber numberWithInteger:row]
                                   forKey:[NSNumber numberWithInteger:component]];
        for (NSInteger idx = component; idx < self.numberOfComponents - 1; idx++) {//更新下一列数据
            [self.pickerView selectRow:0 inComponent:idx + 1 animated:YES];
            [self.multiSelectIndexs setObject:[NSNumber numberWithInteger:0]
                                       forKey:[NSNumber numberWithInteger:idx + 1]];
            [self.pickerView reloadComponent:idx + 1];
        }
    } else if (self.type == WCYDataPickerTypeUnrelatedColumns){ // 不相关多列选择
        [self.multiSelectIndexs setObject:[NSNumber numberWithInteger:row]
                                   forKey:[NSNumber numberWithInteger:component]];
    }
}

@end
