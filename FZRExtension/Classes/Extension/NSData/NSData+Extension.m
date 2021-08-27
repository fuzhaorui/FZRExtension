//
//  NSData+extension.m
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/25.
//

#import "NSData+Extension.h"

@implementation NSData (MyExtension)

/// MARK: - NSData扩展: 将 NSData 转成 NSDictionary
- (NSDictionary *)dictionary
{
    return  [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableLeaves error:nil];
}

/// MARK: - NSData扩展: 将 NSData 转成 NSArray
- (NSArray *)array
{
    return  [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

@end
