//
//  NSDate+Extension.m
//  IOSRE
//
//  Created by fuzhaorui on 2019/6/19.
//

#import "NSDate+Extension.h"

@implementation NSDate (MyExtension)

/// MARK: - 获取当前时间戳(秒)
+ (NSString *)secondTimeStamp{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a = [dat timeIntervalSince1970];
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型

    return timeString;
    
}

/// MARK: - 获取当前时间戳 （毫秒）
+ (NSString *)millisecondTimeStamp{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a = [dat timeIntervalSince1970]*1000;
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型

    return timeString;
    
}

@end
