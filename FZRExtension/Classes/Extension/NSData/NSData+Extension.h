//
//  NSData+extension.h
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/25.
//

#import <Foundation/Foundation.h>


@interface NSData (MyExtension)


/// MARK: - NSData扩展: 将 NSData 转成 NSDictionary
- (NSDictionary *)dictionary;

/// MARK: - NSData扩展: 将 NSData 转成 NSArray
- (NSArray *)array;


@end
