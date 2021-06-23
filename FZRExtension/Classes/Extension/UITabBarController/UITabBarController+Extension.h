//
//  UITabBarController+Extension.h
//  IOSRE
//
//  Created by fuzhaorui on 2019/6/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (MyExtension)

/// MARK: - TabBarController 的 TabBar 是否隐藏
- (void)hidesTabBar:(BOOL)hidden;

/// MARK: - TabBarController 的 TabBar 是否隐藏
- (void)makeTabBarHidden:(BOOL)hide;

@end

NS_ASSUME_NONNULL_END
