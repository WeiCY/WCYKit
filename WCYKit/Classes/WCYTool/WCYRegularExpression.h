//
//  WCYRegularExpression.h
//  WCYKitDemo
//
//  Created by wcy on 2018/10/31.
//  Copyright © 2018 wcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 正则表达式校验
 */
@interface WCYRegularExpression : NSObject

#pragma mark - 手机号码相关

#pragma mark - 手机号校验
/**
 是否为电话号码
 【最简单写法】
 只校验 11位  纯数字

 @param phoneNumber 传入需要检测的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_mostSimpleRegularPhoneNumber:(NSString *)phoneNumber;

/**
 是否为电话号码
 【简单写法】

 @param phoneNumber 传入需要检测的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_simpleRegularPhoneNumber:(NSString *)phoneNumber;

/**
 是否为电话号码
 【复杂写法】

 @param phoneNumber 传入需要检测的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsPhoneNumber:(NSString *)phoneNumber;

#pragma mark - 手机号码归属
/**
 判断是否是：移动手机号

 @param phoneNumber 手机号码
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsChinaMobile:(NSString *)phoneNumber;

/**
 判断是否是：联通手机号

 @param phoneNumber 手机号码
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsChinaUnicom:(NSString *)phoneNumber;

/**
 判断是否是：电信手机号

 @param phoneNumber 手机号码
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsChinaTelecom:(NSString *)phoneNumber;

/**
 判断具体是哪个运营商的手机号

 @param phoneNumber 手机号码
 @return 返回：中国移动、中国联通、中国电信、未知
 */
+ (NSString *)wcy_getPhoneNumType:(NSString *)phoneNumber;

#pragma mark - 邮箱验证
/**
 检测是否为邮箱

 @param emailStr 传入需要检测的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsEmailQualified:(NSString *)emailStr;

#pragma mark - 身份证校验
/**
 验证身份证号（15位或18位数字）【最全的身份证校验，带校验位】

 @param idCardNumberStr 传入需要检测的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsIdCardNumberQualified:(NSString *)idCardNumberStr;

#pragma mark - 银行卡校验
/**
 校验是否是合法的银行卡号

 @param cardNumber 银行卡号
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsBankCardNumber:(NSString *)cardNumber;

#pragma mark - 验证码校验

/**
 校验是否是合法的验证码
 6位数字 4位数字  里面可修改

 @param verifyCode 验证码
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsValidateVerifyCode:(NSString *)verifyCode;

#pragma mark - 中文汉字校验

/**
 校验是否是纯汉字

 @param str 校验的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsPureChineseWithStr:(NSString *)str;

/**
 校验是否是包含汉字
 NSString的扩展中包含 后期调整
 @param str 校验的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsInCludeChineseWithStr:(NSString *)str;

#pragma mark - 数字校验
/**
 校验是否是纯数字

 内部实现方法已修改，详细可看内部实现
 @param numStr 校验的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsPureNumber:(NSString *)numStr;

#pragma mark - 英文验证
/**
 校验是否是由26个英文字母组成的字符串

 @param englishAlphabetStr 传入需要检测的字符串
 @return 返回检测结果 是或者不是
 */
+ (BOOL)wcy_regularIsPureEnglishAlphabet:(NSString *)englishAlphabetStr;

#pragma mark - 正则表达式简单说明  一是为了以后好了解 二是防止有人不懂
/*！
 *  正则表达式简单说明
 *  语法：
 .       匹配除换行符以外的任意字符
 \w      匹配字母或数字或下划线或汉字
 \s      匹配任意的空白符
 \d      匹配数字
 \b      匹配单词的开始或结束
 ^       匹配字符串的开始
 $       匹配字符串的结束
 *       重复零次或更多次
 +       重复一次或更多次
 ?       重复零次或一次
 {n}     重复n次
 {n,}     重复n次或更多次
 {n,m}     重复n到m次
 \W      匹配任意不是字母，数字，下划线，汉字的字符
 \S      匹配任意不是空白符的字符
 \D      匹配任意非数字的字符
 \B      匹配不是单词开头或结束的位置
 [^x]     匹配除了x以外的任意字符
 [^aeiou]匹配除了aeiou这几个字母以外的任意字符
 *?      重复任意次，但尽可能少重复
 +?      重复1次或更多次，但尽可能少重复
 ??      重复0次或1次，但尽可能少重复
 {n,m}?     重复n到m次，但尽可能少重复
 {n,}?     重复n次以上，但尽可能少重复
 \a      报警字符(打印它的效果是电脑嘀一声)
 \b      通常是单词分界位置，但如果在字符类里使用代表退格
 \t      制表符，Tab
 \r      回车
 \v      竖向制表符
 \f      换页符
 \n      换行符
 \e      Escape
 \0nn     ASCII代码中八进制代码为nn的字符
 \xnn     ASCII代码中十六进制代码为nn的字符
 \unnnn     Unicode代码中十六进制代码为nnnn的字符
 \cN     ASCII控制字符。比如\cC代表Ctrl+C
 \A      字符串开头(类似^，但不受处理多行选项的影响)
 \Z      字符串结尾或行尾(不受处理多行选项的影响)
 \z      字符串结尾(类似$，但不受处理多行选项的影响)
 \G      当前搜索的开头
 \p{name}     Unicode中命名为name的字符类，例如\p{IsGreek}
 (?>exp)     贪婪子表达式
 (?<x>-<y>exp)     平衡组
 (?im-nsx:exp)     在子表达式exp中改变处理选项
 (?im-nsx)       为表达式后面的部分改变处理选项
 (?(exp)yes|no)     把exp当作零宽正向先行断言，如果在这个位置能匹配，使用yes作为此组的表达式；否则使用no
 (?(exp)yes)     同上，只是使用空表达式作为no
 (?(name)yes|no) 如果命名为name的组捕获到了内容，使用yes作为表达式；否则使用no
 (?(name)yes)     同上，只是使用空表达式作为no
 
 捕获
 (exp)               匹配exp,并捕获文本到自动命名的组里
 (?<name>exp)        匹配exp,并捕获文本到名称为name的组里，也可以写成(?'name'exp)
 (?:exp)             匹配exp,不捕获匹配的文本，也不给此分组分配组号
 零宽断言
 (?=exp)             匹配exp前面的位置
 (?<=exp)            匹配exp后面的位置
 (?!exp)             匹配后面跟的不是exp的位置
 (?<!exp)            匹配前面不是exp的位置
 注释
 (?#comment)         这种类型的分组不对正则表达式的处理产生任何影响，用于提供注释让人阅读
 
 *  表达式：\(?0\d{2}[) -]?\d{8}
 *  这个表达式可以匹配几种格式的电话号码，像(010)88886666，或022-22334455，或02912345678等。
 *  我们对它进行一些分析吧：
 *  首先是一个转义字符\(,它能出现0次或1次(?),然后是一个0，后面跟着2个数字(\d{2})，然后是)或-或空格中的一个，它出现1次或不出现(?)，
 *  最后是8个数字(\d{8})
 */
@end

NS_ASSUME_NONNULL_END
