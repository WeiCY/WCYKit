//
//  WCYDataPicker.h
//  MyXueBei
//
//  Created by wcy on 2018/9/20.
//  Copyright © 2018年 wcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 选中的回调
// 单行Datapicker （选中行和内容）
typedef void(^WCYDataPickerSingleSelected)(NSInteger index, NSString *content);

/**
 选中多行Datapicker的回调

 @param indexs 每列的选中行序号，key和value都是NSNumber类型数据
 @param contents 每列的选中内容，key是NSNumber类型数据，value是NSString类型数据
 */
typedef void(^WCYDataPickerMultiSelected)(NSDictionary *indexs, NSDictionary *contents);

/**
 封装的选择器
 写的比较简陋
 推荐BRPickerView 一个封装的很全的三方选择库
 
 */
@interface WCYDataPicker : UIView

/**
 单例 生成选择器

 @return 选择器的实例
 */
+ (WCYDataPicker *)dataPicker;

/**
 单列选择器

 @param title   选择器标题
 @param delegate self   不使用代理的时候 默认数据源为source  设置代理 数据源为代理中设置的
 @param source  选择器数据源，包含NSString类型数据
 @param index   当前选中行
                可以保存实现再次打开为上次状态
                e.g:
                NSInteger index = 0;
                if ([array containsObject:self.tit]) {
                    index = [array indexOfObject:self.tit];
                }
 
                [dataPicker showSingleDataPickerWithTitle:@"32" delegate:self dataSource:array selectedIndex:index completeBlock:^(NSInteger index, NSString * _Nonnull content) {
                        self.tit = content;
                }];
 
 @param block   回调
 */
- (void)showSingleDataPickerWithTitle:(NSString *)title
                             delegate:(id)delegate
                           dataSource:(NSArray *)source
                        selectedIndex:(NSInteger)index
                        completeBlock:(WCYDataPickerSingleSelected)block;

/**
 相关联多列选择器(后一列数据会根据前一列数据更改而更改，比如选择省市区)

 @param title 选择器标题
 @param delegate 必须设置对象并实现WCDataPickerDelegate方法获取数据来源
 @param columns 选择器列数，无论几列数据都由dataPicker:dataSourceInColumn:方法返回
 @param indexs 每列的选中行字典，包含的key和value都是NSNumber类型数据，
               比如：@{
                        [NSNumber numberWithInteger:1]，
                        [NSNumber numberWithInteger:2]
                     } 表示第2列选中第3行
 
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithInteger:2] forKey:[NSNumber numberWithInteger:0]];
    [dic setObject:[NSNumber numberWithInteger:1] forKey:[NSNumber numberWithInteger:1]];
 
 @param block 回调
 */
- (void)showMultiReletedDataPickerWithTitle:(NSString *)title
                                   delegate:(id)delegate
                               numOfColumns:(NSInteger)columns
                             selectedIndexs:(NSDictionary *)indexs
                              completeBlock:(WCYDataPickerMultiSelected)block;

/**
 不关联多列选择器(各列数据相独立，不相互影响)

 @param title 选择器标题
 @param delegate 必须设置对象并实现WCDataPickerDelegate方法获取数据来源
 @param columns 选择器列数，无论几列数据都由dataPicker:dataSourceInColumn:方法返回
 @param indexs 每列的选中行字典，包含的key和value都是NSNumber类型数据，
 @param block 回调
 */
- (void)showMultiUnRelatedDataPickerWithTitle:(NSString *)title
                                     delegate:(id)delegate
                                 numOfColumns:(NSInteger)columns
                               selectedIndexs:(NSDictionary *)indexs
                                completeBlock:(WCYDataPickerMultiSelected)block;

@end

@protocol WCYDataPickerDelegate <NSObject>

@optional

/**
 选择器数据来源(单列选择器设置delegate不为nil时实现则数据源以该设置为准)
 调用多列选择器方法中设置了delegate，则必须实现该方法，会根据column判断每列返回的数据

 @param dataPicker dataPicker
 @param column column
 @return 数组
 */
- (NSArray *)dataPicker:(WCYDataPicker *)dataPicker dataSourceInColumn:(NSInteger)column;

#pragma mark - 下方两个代理一般不处理 直接在回调中获取
/**
 单行选择器的选中代理

 @param dataPicker 选择器
 @param index 选中行数
 @param content 选中内容
 */
- (void)dataPicker:(WCYDataPicker *)dataPicker selectedSingleIndex:(NSInteger)index selectedSingleContent:(NSString *)content;

/**
 多行选择器的选中代理

 @param dataPicker 多行选择器
 @param indexs 选中行数的字典
 @param contents 选中内容的字典
 */
- (void)dataPicker:(WCYDataPicker *)dataPicker selectedMultiIndexs:(NSDictionary *)indexs selectedMultiContents:(NSDictionary *)contents;

@end

NS_ASSUME_NONNULL_END
