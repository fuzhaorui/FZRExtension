//
//  UITabBarController+Extension.m
//  IOSRE
//
//  Created by fuzhaorui on 2019/6/19.
//

#import "UITabBarController+Extension.h"

@implementation UITabBarController (MyExtension)

/// MARK: - TabBarController 的 TabBar 是否隐藏
- (void)hidesTabBar:(BOOL)hidden{
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:0];
    
    for (UIView *view in self.view.subviews) {
        
        if ([view isKindOfClass:[UITabBar class]]) {
            
            if (hidden) {
                
                [view setFrame:CGRectMake(view.frame.origin.x, [UIScreen mainScreen].bounds.size.height, view.frame.size.width , view.frame.size.height)];
                
            }
            else{
                
                [view setFrame:CGRectMake(view.frame.origin.x, [UIScreen mainScreen].bounds.size.height - 49, view.frame.size.width, view.frame.size.height)];
                
            }
        }else{
            
            if([view isKindOfClass:NSClassFromString(@"UITransitionView")]){
                
                if (hidden) {
                    
                    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, [UIScreen mainScreen].bounds.size.height)];
                    
                }
                else{
                    
                    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, [UIScreen mainScreen].bounds.size.height - 49 )];
                   
                }
            }
        }
    }
    
    [UIView commitAnimations];
    
}

/// MARK: - TabBarController 的 TabBar 是否隐藏
- (void)makeTabBarHidden:(BOOL)hide {
    
    // Custom code to hide TabBar
    
    if ( [self.view.subviews count] < 2 )
    {
        return;
    }
    
    UIView *contentView; if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
    {
        
        contentView = [self.view.subviews objectAtIndex:1];
        
    }
    else {
        
        contentView = [self.view.subviews objectAtIndex:0];
        
        
    }
    
    if (hide) {
        
        contentView.frame = self.view.bounds;
        
    } else {
            
        contentView.frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y,
                                           self.view.bounds.size.width, self.view.bounds.size.height -
                                           self.tabBar.frame.size.height);
    }
    
    self.tabBar.hidden = hide;
    
}

@end
