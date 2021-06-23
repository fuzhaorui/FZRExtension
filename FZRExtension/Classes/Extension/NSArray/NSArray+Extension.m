//
//  NSArray+Extension.m
//  IOSRE
//
//  Created by fuzhaorui on 2019/6/19.
//

#import "NSArray+Extension.h"

@implementation NSArray (MyExtension)

/// MARK: - 将 NSArray 转换 NSData
- (NSData *)data
{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

/// MARK: - 将 NSArray 转换 NSData plist序列化
- (NSData *)plistData{
    return [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0  options:1 error:nil];
}

/// MARK: - 将 NSArray 保存为 .plist
- (void)saveFile:(NSString *)filePath{
    
    [self.plistData writeToFile:filePath atomically:YES];
    
}

/// MARK: - 将 .plist  读取为 NSArray
+ (NSMutableArray *)readFile:(NSString *)filePath{

    return [[NSMutableArray alloc]initWithArray:[NSArray arrayWithContentsOfFile:filePath]];

}

/// MARK: - 删除Array中重复的项目
- (NSArray *)cleanRepeatItem{
    
    NSSet *set = [NSSet setWithArray:self];
    
    return set.allObjects;
    
}

@end
