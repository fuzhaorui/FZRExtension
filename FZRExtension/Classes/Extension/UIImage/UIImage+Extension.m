//
//  UIImage+Extension.m
//  TiktokIOSRE
//
//  Created by FZR on 2021/3/6.
//

#import "UIImage+Extension.h"

@implementation UIImage (MyExtension)

/// MARK: - 将UIImage转成Base64字符串
- (NSString *)encodeToBase64String {

    return [UIImagePNGRepresentation(self) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

}


@end
