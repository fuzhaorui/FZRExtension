//
//  UIImage+Extension.h
//  TiktokIOSRE
//
//  Created by FZR on 2021/3/6.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MyExtension)

/// MARK: - 将UIImage转成Base64字符串
- (NSString *)encodeToBase64String;

@end

NS_ASSUME_NONNULL_END
