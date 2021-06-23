//
//  NSArray+Extension.h
//  IOSRE
//
//  Created by fuzhaorui on 2019/6/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MyExtension)

/// MARK: - 将 NSArray 转换 NSData
- (NSData *)data;


/// MARK: - 将 NSArray 转换 NSData plist序列化
- (NSData *)plistData;


/// MARK: - 将 NSArray 保存为 .plist
- (void)saveFile:(NSString *)filePath;


/// MARK: - 将 .plist  读取为 NSArray
+ (NSMutableArray *)readFile:(NSString *)filePath;


/// MARK: - 删除Array中重复的项目
- (NSArray *)cleanRepeatItem;

@end

NS_ASSUME_NONNULL_END
