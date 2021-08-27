//
//  NSString+extension.h
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TimeType) {
    
    ///返回类型: 周一
    TimeType_One   = 1,
    
    ///返回类型: yyyy-MM-dd HH:mm:ss
    TimeType_Two   = 2,
    
    ///返回类型: MM-dd
    TimeType_Therr = 3,
    
    ///返回类型: HH:mm
    TimeType_Four  = 4,
    
    ///返回类型: MM月
    TimeType_Five  = 5,
    
    ///返回类型: yyyy-MM
    TimeType_Six   = 6,
    
    ///返回类型: yyyy-MM-dd
    TimeType_Seven = 7,
    
    ///返回类型: "今天"  "昨天"  "" yyyy-MM-dd
    TimeType_Eight = 8
};



@interface NSString (MyExtension)

/// MARK: - 根据字体大小,获取字符串的高度 参数:fontSize 字体大小CGFloat 参数:width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGFloat)heightfontSize:(CGFloat)fontSize andWidth:(CGFloat)width;


/// MARK: - 根据字体,获取字符串的高度 参数:font 字体大小UIFont 参数:width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGFloat)heightfont:(UIFont *)font andWidth:(CGFloat)width;


/// MARK: - 根据字体大小,获取字符串的size 参数:fontSize 字体大小CGFloat 参数:width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGSize)sizefontSize:(CGFloat)fontSize andWidth:(CGFloat)width;


/// MARK: - 根据字体,获取字符串的size 参数:font 字体大小UIFont 参数:width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGSize)sizefont:(UIFont *)font andWidth:(CGFloat)width;


/// MARK: - NSString扩展:转化时间类型的NSString
- (NSString *)time:(TimeType)timeType;


/// MARK: - NSString扩展:md5加密 小写字母
- (NSString *)md5;

/// MARK: - NSString扩展:MD5加密 大写字母
- (NSString *)MD5;


/// MARK: - NSString扩展:将NSString转化为NSData
- (NSData *)data;


/// MARK: - NSString扩展:将NSString转化为NSData
- (UIColor *)color;

/// MARK: - 返回 含有中文的个数
- (int)chineseCharacterFormat;

/// MARK: - 检验:regex为检验正则表达式
- (BOOL) validate:(NSString *)regex;

/// MARK: - 检验:是否邮箱
- (BOOL) validateEmail;

/// MARK: - 检验:是否手机号码
- (BOOL) validateMobile;

/// MARK: - 检验:是否电话号码
- (BOOL) validateTel;

/// MARK: - 检验:是否手机号码
- (BOOL) isTwoValidateMobile;

/// MARK: - 检验:是否银行卡
- (BOOL) validateBankCard;

/// MARK: - 检验:是否身份证
- (BOOL) validateIdentityCard;

/// MARK: - 检验:是否正整数
- (BOOL) validatePositiveInteger;

/// MARK: - 检验:是否是  中国邮政编码
- (BOOL) validatePostCode;

/// MARK: - 将NSString依次将每个字符截取成NSArray
- (NSArray *)interceptChar;

/// MARK: - 字符串改成大写字符串(MOBILE DEBILOPER TIPS)
- (NSString *)uppercase;

/// MARK: - 字符串改成首字母大写字符串(Mobile Developer Tips)
- (NSString *)caps;

/// MARK: - 字符串改成x小写字符串(mobile developer tips)
- (NSString *)lowercase;

/// MARK: - 生成随机字符串: number:字符串长度  type = 1(0),type = 2(A),type = 3(a),type = 4(0A),type = 5(0a),type = 6(Aa),type = 7(Aa)
+ (NSString *)createCharacterString:(NSInteger)type number:(int)kNumber;

/// MARK: - 去除URL特殊符号影响,只对特殊符号URLEncoding
- (NSString *)URLEncodingSpecialSymbols;

/// MARK: - URL编码
- (NSString *)URLEncoding;

/// MARK: - 将Base64字符串转成UIImage
- (UIImage *)decodeBase64ToImage;

@end
