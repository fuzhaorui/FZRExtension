//
//  UIColor+Extension.h
//  PDDIOSRE
//
//  Created by fuzhaorui on 2019/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MyExtension)

/// MARK: - UIColor 转 UIImage
- (UIImage *)image;

/// MARK: - UIColor 转 十六进制NSString（#FFFFFF）
- (NSString *)hexadecimalFromUIColor;

@end

NS_ASSUME_NONNULL_END
