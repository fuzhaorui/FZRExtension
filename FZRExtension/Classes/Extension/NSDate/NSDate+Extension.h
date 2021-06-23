//
//  NSDate+Extension.h
//  IOSRE
//
//  Created by fuzhaorui on 2019/6/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MyExtension)

/// MARK: - 获取当前时间戳(秒)
+ (NSString *)secondTimeStamp;

/// MARK: - 获取当前时间戳 （毫秒）
+ (NSString *)millisecondTimeStamp;

@end

NS_ASSUME_NONNULL_END
