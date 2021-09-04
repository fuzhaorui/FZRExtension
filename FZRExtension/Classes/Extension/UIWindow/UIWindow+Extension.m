//
//  UIWindow+Extension.m
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/31.
//

#import "UIWindow+Extension.h"


@implementation UIWindow (MyExtension)

/// MARK: - 系统级UIWindow
 +(UIWindow *)baseWindow{
     
    UIWindow *keyWindow = nil;

    if (@available(iOS 13.0, *)) {
        
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                
                keyWindow = windowScene.windows.firstObject;
                
                break;
                
            }
            
        }
        
    } else{

        keyWindow = [UIApplication sharedApplication].keyWindow;

    }
    
    return keyWindow;
}


@end
