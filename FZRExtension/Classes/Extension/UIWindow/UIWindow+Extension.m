//
//  UIWindow+Extension.m
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/31.
//

#import "UIWindow+Extension.h"


@implementation UIWindow (MyExtension)

/// MARK: - 系统级UIWindow
 +(UIWindow *)keyWindow{
    UIWindow *keyWindow = nil;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 // 编译时检查SDK版本：Xcode11+编译会调用（iOS SDK 13.0 以后版本的处理）
    if (@available(iOS 13.0, *)) {
        NSSet<UIScene *> *connectedScenes = [UIApplication sharedApplication].connectedScenes;
        for (UIScene *scene in connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive && [scene isKindOfClass:[UIWindowScene class]]) {
                UIWindowScene *windowScene = (UIWindowScene *)scene;
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        keyWindow = window;
                        break;
                    }
                }
            }
        }
    } else
#endif
    {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 130000
        return  [UIApplication sharedApplication].keyWindow;
#endif
    }
    
    return keyWindow;
}


@end