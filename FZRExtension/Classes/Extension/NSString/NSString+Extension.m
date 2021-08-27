//
//  NSString+extension.m
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/25.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MyExtension)



/// MARK: - 根据字体大小,获取字符串的高度参数: fontSize 字体大小CGFloat参数: width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGFloat)heightfontSize:(CGFloat)fontSize andWidth:(CGFloat)width
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return [self sizefont:font andWidth:width].height;
}


/// MARK: - 根据字体,获取字符串的高度参数: font 字体大小UIFont参数: width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGFloat)heightfont:(UIFont *)font andWidth:(CGFloat)width
{
    return [self sizefont:font andWidth:width].height;
}


/// MARK: - 根据字体大小,获取字符串的size参数: fontSize 字体大小CGFloat参数: width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGSize)sizefontSize:(CGFloat)fontSize andWidth:(CGFloat)width
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return [self sizefont:font andWidth:width];
}


/// MARK: - 根据字体,获取字符串的size参数: font 字体大小UIFont参数: width 限制一行显示的宽度返回: 返回文本在width宽度的条件下的总高度
- (CGSize)sizefont:(UIFont *)font andWidth:(CGFloat)width
{
    CGSize sizeOrgin = CGSizeMake(width, 1000);
    NSDictionary *dic = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    return [self boundingRectWithSize:sizeOrgin options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
}


/// MARK: - NSString扩展:转化时间类型的NSString
- (NSString *)time:(TimeType)timeType;
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue/1000];
    
    NSString *type = @"";
    
    if (timeType == TimeType_One) {
        
        NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
        
        NSString *weekStr = [weekday objectAtIndex:components.weekday];
        
        return weekStr;
    }
    else if (timeType == TimeType_Two)
    {
        type = @"yyyy-MM-dd HH:mm:ss";
    }
    
    else if (timeType == TimeType_Therr)
    {
        type = @"MM-dd";
    }
    
    else if (timeType == TimeType_Four)
    {
        type = @"HH:mm";
    }
    
    else if (timeType == TimeType_Five)
    {
        type = @"yyyy年MM月";
    }
    
    else if (timeType == TimeType_Six)
    {
        type = @"yyyy-MM";
    }
    else if (timeType == TimeType_Seven)
    {
        type = @"yyyy-MM-dd";
    }
    else if (timeType == TimeType_Eight)
    {
        
        NSDate         *todayDate = [NSDate dateWithTimeIntervalSinceNow:0];
        NSTimeInterval todayTime=[todayDate timeIntervalSince1970];
        
        NSString *today = [[NSString stringWithFormat:@"%.0lf",todayTime *1000] time:TimeType_Seven];
        
        if ([today isEqualToString:[self time:TimeType_Seven]]) {
            return @"今天";
        }
        
        today = [[NSString stringWithFormat:@"%.0lf",todayTime *1000] time:TimeType_One];
        
        for (int i = 1; i<3; i++) {
            
            NSString *day = [NSString stringWithFormat:@"%.0lf",(todayTime - i*24*60*60)*1000];
            
            if ([[day time:TimeType_Seven] isEqualToString:[self time:TimeType_Seven]])
            {
                
                if(i==1){
                    return @"昨天";
                }
                else if(i==2){
                    if ([today isEqualToString:@"周一"]) {
                        return [NSString stringWithFormat:@"上周%@",[self time:TimeType_One]] ;
                    }
                    else
                    {
                        return  [self time:TimeType_One];
                    }
                }
            }
        }
        
        return [self time:TimeType_Seven];
    }
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:type];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}


/// MARK: - NSString扩展:MD5加密
- (NSString *)md5
{
    return  [self MD5Encryption:1];
}

/// MARK: - NSString扩展:MD5加密 大写字母
- (NSString *)MD5
{
   return  [self MD5Encryption:2];
}

- (NSString *)MD5Encryption:(int)type
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    const char *original_str = [self UTF8String];
    
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++) {
        if(i == 1){
            [hash appendFormat:@"%02x", result[i]];
        }
        else{
            [hash appendFormat:@"%02X", result[i]];
        }
            
        
    }
    return hash;
}


/// MARK: - NSString扩展:将NSString转化为NSData
- (NSData *)data
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}


/// MARK: - NSString扩展:将NSString转化为NSData
- (UIColor *)color
{
    if (!self || [self isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = self.length == 7?1:0;
    [[NSScanner scannerWithString:[self substringWithRange:range]] scanHexInt:&red];
    range.location = self.length == 7?3:2;
    [[NSScanner scannerWithString:[self substringWithRange:range]] scanHexInt:&green];
    range.location = self.length == 7?5:4;
    [[NSScanner scannerWithString:[self substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}


/// MARK: - 返回 含有中文的个数
- (int)chineseCharacterFormat
{
    int x=0;
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a >= 0x4e00 && a <= 0x9fff)
        {
            x++;
        }
    }
    return x;
}


/// MARK: - 检验:regex为检验正则表达式
- (BOOL) validate:(NSString *)regex
{
    if (self.length <= 0) {
        return NO;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isBool = [predicate evaluateWithObject:self];
    return isBool;
}



/// MARK: - 检验:是否邮箱
- (BOOL) validateEmail
{
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    BOOL isBool = [predicate evaluateWithObject:self];
    return isBool;
}


/// MARK: - 检验:是否手机号码
- (BOOL) validateMobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex =@"^1[3|4|5|6|7|8|9][0-9]{1}[0-9]{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    BOOL isBool = [predicate evaluateWithObject:self];
    return isBool;
}


/// MARK: - 检验:是否电话号码
- (BOOL) validateTel
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *telRegex =@"^(0[0-9]{2})\\d{8}$|^(0[0-9]{3}(\\d{7,8}))$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",telRegex];
    BOOL isBool = [predicate evaluateWithObject:self];
    return isBool;
}



/// MARK: - 检验:是否手机号码
- (BOOL) isTwoValidateMobile
{
    /*
     *手机号码
     *移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     *联通：130,131,132,152,155,156,185,186
     *电信：133,1349,153,180,189
     */
    NSString *MOBILE =@"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /*
     *中国移动：China Mobile
     *134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString *CM =@"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /*
     *中国联通：China Unicom
     *130,131,132,152,155,156,185,186
     */
    NSString *CU =@"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /* 中国电信：China Telecom
     *133,1349,153,180,189
     */
    NSString *CT =@"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /*
     *大陆地区固话及小灵通
     *区号：010,020,021,022,023,024,025,027,028,029
     *号码：七位或八位
     */
    
    // NSString *PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm  evaluateWithObject:self] == YES)
        || ([regextestct  evaluateWithObject:self] == YES)
        || ([regextestcu  evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}




/// MARK: - 检验:是否银行卡
- (BOOL) validateBankCard
{
    if(self.length==0)
    {
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < self.length; i++)
    {
        c = [self characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
    {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo)
        {
            addend = digit *2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}


/// MARK: - 检验:是否身份证
- (BOOL) validateIdentityCard
{
    if (self.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isBool = [predicate evaluateWithObject:self];
    return isBool;
}


/// MARK: - 检验:是否正整数
- (BOOL) validatePositiveInteger
{
    if (self.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^[1-9]\\d*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isBool = [predicate evaluateWithObject:self];
    return isBool;
}


/// MARK: - 检验:是否是  中国邮政编码
- (BOOL) validatePostCode
{
    if (self.length <= 0) {
        return NO;
    }

    NSString *str = [self substringToIndex:2];
    
    if([str isEqualToString:@"00"])
    {
        return NO;
    }
    
    
    NSString *regex2 = @"^[0-9]{6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isBool = [predicate evaluateWithObject:self];
    return isBool;
}

/// MARK: - 将NSString依次将每个字符截取成NSArray
- (NSArray *)interceptChar{
    
    NSMutableArray *charList = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < self.length; i++) {
        
        NSString *charStrring = [self substringWithRange:NSMakeRange(i,1)];
        
        [charList addObject:charStrring];
    }
    
    return charList;
}


/// MARK: - 字符串改成大写字符串(MOBILE DEBILOPER TIPS)
- (NSString *)uppercase{
    
    return [self uppercaseStringWithLocale:[NSLocale currentLocale]];
    
}

/// MARK: - 字符串改成首字母大写字符串(Mobile Developer Tips)
- (NSString *)caps{
    
    return [self capitalizedStringWithLocale:[NSLocale currentLocale]];
    
}

/// MARK: - 字符串改成x小写字符串(mobile developer tips)
- (NSString *)lowercase{
    
    return [self lowercaseStringWithLocale:[NSLocale currentLocale]];
    
}



/// MARK: - 生成随机字符串: number:字符串长度  type = 1(0),type = 2(A),type = 3(a),type = 4(0A),type = 5(0a),type = 6(Aa),type = 7(Aa)
+ (NSString *)createCharacterString:(NSInteger)type number:(int)kNumber{
    
    NSString *sourceStr = @"";
    
    if (type == 1 || type == 4 || type == 5 || type == 7) {
        sourceStr = [NSString stringWithFormat:@"%@0123456789",sourceStr];
    }
    if (type == 2 || type == 4 || type == 6 || type == 7) {
        sourceStr = [NSString stringWithFormat:@"%@ABCDEFGHIJKLMNOPQRSTUVWXYZ",sourceStr];
    }
    if (type == 3 || type == 5 || type == 6 || type == 7) {
        sourceStr = [NSString stringWithFormat:@"%@abcdefghijklmnopqrstuvwxyz",sourceStr];
    }
    
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    
    return resultStr;
    
}

/// MARK: - 去除url特殊符号影响
- (NSString *)URLEncodingSpecialSymbols{
    
    NSString *str = self;
    
    str = [str stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"];
    
    str = [str stringByReplacingOccurrencesOfString:@"?" withString:@"%3F"];
    
    str = [str stringByReplacingOccurrencesOfString:@"%" withString:@"%25"];
    
    str = [str stringByReplacingOccurrencesOfString:@"#" withString:@"%23"];
    
    str = [str stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    
    str = [str stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];

    return str;
}

/// MARK: - URL编码
- (NSString *)URLEncoding{
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
}


/// MARK: - 将Base64字符串转成UIImage
- (UIImage *)decodeBase64ToImage{
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];

    return [UIImage imageWithData:data];
    
}



@end
