//
//  UIView+Extension.h
//  sender
//
//  Created by fuzhaorui on 16/8/31.
//

#import <UIKit/UIKit.h>

@interface UIView (MyExtension)


/// MARK: - 任意UIView 截图
- (UIImage *)screenshot;


/// MARK: - UIView的动画; rect:动画后 UIView的frame; duration:动画耗时; delay:动画延迟时间
- (void)animationRect:(CGRect)rect andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay;


/// MARK: -UIView的动画; point:动画后 UIView的contentOffset; duration:动画耗时; delay:动画延迟时间
- (void)animationCandontentOffset:(CGPoint)point andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay;


/// MARK: - UIView的动画; alpha:动画后 UIView的alpha; duration:动画耗时; delay:动画延迟时间
- (void)animationAlpha:(CGFloat)alpha andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay;


/// MARK: - UIView的动画; backgroundColor:动画后 UIView的backgroundColor; duration:动画耗时; delay:动画延迟时间
- (void)animationBackgroundColor:(UIColor *)backgroundColor andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay;


/// MARK: - UIView的动画; center:动画后 UIView的center; duration:动画耗时; delay:动画延迟时间
- (void)animationCenter:(CGPoint)center andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay;


/// MARK: - 设置默认Layer
- (void)setDefaultLayer;


/// MARK: - 设置默认Shadow
- (void)setDefaultShadow;


/// MARK: - 设置Layer; borderColor:边框颜色; borderwinth:边框大小; cornerRadius:设置圆角; clipsToBounds:去除多余圆角
- (void)setBorderColor:(UIColor *)borderColor andBorderwinth:(CGFloat)borderwinth andCornerRadius:(CGFloat)cornerRadius andClipsToBounds:(BOOL)clipsToBounds;


/// MARK: - 设置Shadow; shadowColor:阴影颜色; shadowOffset:阴影偏移; shadowOpacity:阴影透明度; shadowRadius:阴影半径; cornerRadius:半径
- (void)setShadowColor:(UIColor *)shadowColor andShadowOffset:(CGSize)shadowOffset
     andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius andCornerRadius:(CGFloat)cornerRadius;


/// MARK: - 设置Shadow; shadowColor:阴影颜色; shadowOffset:阴影偏移; shadowOpacity:阴影透明度; shadowRadius:阴影半径; cornerRadius:半径; borderColor:边框颜色; borderwinth:边框大小
- (void)setShadowColor:(UIColor *)shadowColor andShadowOffset:(CGSize)shadowOffset
     andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius andCornerRadius:(CGFloat)cornerRadius andBorderColor:(UIColor *)borderColor andBorderwinth:(CGFloat)borderwinth;
@end
