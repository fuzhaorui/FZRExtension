//
//  UINavigationController+Extension.m
//  sender
//
//  Created by fuzhaorui on 16/8/31.
//

#import "UINavigationController+Extension.h"

@implementation UINavigationController (MyExtension)
/// MARK: - 截屏 包括UINavigationController
- (UIImage *)screenshot
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
    
    CGContextRef context =  UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, self.view.bounds.origin.x *-1, self.view.bounds.origin.y *-1);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    if (currentContext==nil) {
        return nil;
    }
    
    [self.view.layer  renderInContext:currentContext];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end
