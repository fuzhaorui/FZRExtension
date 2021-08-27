//
//  NSDictionary+extension.m
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/25.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (MyExtension)

/// MARK: - 将 NSDictionary 转换 NSData plist序列化
- (NSData *)plistData{
    return  [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:1 error:nil];
}
/// MARK: - NSDictionary扩展: 将 NSDictionary 拼接成网络请求参数 String
- (NSString *)mosaicParameter
{
    NSArray  *keys= [self allKeys];
    NSString *string = @"";
    for(int i=0;i<[keys count];i++)
    {
        NSString *key=[keys objectAtIndex:i];
        if (i==0) {
            string = [NSString stringWithFormat:@"%@=%@",key,[self objectForKey:key]];
        }
        else
        {
            string = [NSString stringWithFormat:@"%@&%@=%@",string,key,[self objectForKey:key]];
        }
    }
    
    string = [string stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    return string;
}




/// MARK: - NSDictionary扩展: 将 NSDictionary 转成 NSData
- (NSData *)data
{
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

/// MARK: - NSDictionary扩展: 将 NSDictionary 转成 json 字符串
- (NSString *)jsonStr{
    
    NSError *error;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];

    NSString *jsonString;

    if (!jsonData) {

        NSLog(@"%@",error);

        }else{

            jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

        }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

    NSRange range = {0,jsonString.length};

    //去掉字符串中的空格

    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];

    NSRange range2 = {0,mutStr.length};

    //去掉字符串中的换行符

    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];

    return mutStr;
    
}


@end
