//
//  NSDictionary+extension.h
//  sender
//
//  Created by fuzhaorui on 16/8/25.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MyExtension)

/// MARK: - 将 NSDictionary 转换 NSData plist序列化
- (NSData *)plistData;

/// MARK: - NSDictionary扩展: 将 NSDictionary 拼接成网络请求参数 String
- (NSString *)mosaicParameter;

/// MARK: - NSDictionary扩展: 将 NSDictionary 转成 NSData
- (NSData *)data;

/// MARK: - NSDictionary扩展: 将 NSDictionary 转成 json 字符串
- (NSString *)jsonStr;

@end
