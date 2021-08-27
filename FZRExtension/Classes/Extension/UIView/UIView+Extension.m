//
//  UIView+Extension.m
//  FZRExtension
//
//  Created by fuzhaorui on 16/8/31.
//

#import "UIView+Extension.h"
#import "NSString+Extension.h"

@implementation UIView (MyExtension)


/// MARK: - 任意UIView 截图

- (UIImage *)screenshot
{
    //截屏 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(self.layer.bounds.size, self.layer.opaque, 0.0);
    
    //　　定义了如何画字的边缘层。为每个四个边(左,右,下,上)如果相应的位设置将antialiased边缘。通常此属性用于禁用抗锯齿的边缘邻接其他层,边缘消除接缝,就会出现。默认值是对于所有antialiased边缘。
    [self.layer  renderInContext:UIGraphicsGetCurrentContext()];
    
    
    //定义Image 获取view截图
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return viewImage;
}

/// MARK: - UIView的动画; rect :动画后 UIView的frame; duration :动画耗时; delay :动画延迟时间
- (void)animationRect:(CGRect)rect andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay
{
    //创建动画
    [UIView beginAnimations:nil context:nil];
    //动画时间
    [UIView setAnimationDuration:duration];
    //延迟时间
    [UIView setAnimationDelay:delay];
    //移动后的位置
    self.frame = *(&rect);
    //开始动画
    [UIView commitAnimations];
}





/// MARK: - UIView的动画; point :动画后 UIView的contentOffset; duration :动画耗时; delay :动画延迟时间
- (void)animationCandontentOffset:(CGPoint)point andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay
{
    
    UIScrollView *scrollView = (UIScrollView *)self;
    //创建动画
    [UIView beginAnimations:nil context:nil];
    //动画时间
    [UIView setAnimationDuration:duration];
    //延迟时间
    [UIView setAnimationDelay:delay];
    //移动后的位置
    scrollView.contentOffset = *(&point);
    //开始动画
    [UIView commitAnimations];
}





/// MARK: - UIView的动画; alpha :动画后 UIView的alpha; duration :动画耗时; delay :动画延迟时间
- (void)animationAlpha:(CGFloat)alpha andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay
{
    //创建动画
    [UIView beginAnimations:nil context:nil];
    //动画时间
    [UIView setAnimationDuration:duration];
    //延时时间
    [UIView setAnimationDelay:delay];
    //移动后的位置
    self.alpha = alpha;
    //开始动画
    [UIView commitAnimations];
}




/// MARK: - UIView的动画; backgroundColor :动画后 UIView的backgroundColor; duration :动画耗时; delay :动画延迟时间
- (void)animationBackgroundColor:(UIColor *)backgroundColor andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay
{
    //创建动画
    [UIView beginAnimations:nil context:nil];
    //动画时间
    [UIView setAnimationDuration:duration];
    //延时时间
    [UIView setAnimationDelay:delay];
    //移动后的位置
    self.backgroundColor = backgroundColor;
    //开始动画
    [UIView commitAnimations];
}


/// MARK: - UIView的动画; center :动画后 UIView的center; duration :动画耗时; delay :动画延迟时间
- (void)animationCenter:(CGPoint)center andDuration:(NSTimeInterval)duration andDelay:(NSTimeInterval)delay
{
    //创建动画
    [UIView beginAnimations:nil context:nil];
    //动画时间
    [UIView setAnimationDuration:duration];
    //延时时间
    [UIView setAnimationDelay:delay];
    //移动后的位置
    self.center = center;
    //开始动画
    [UIView commitAnimations];
}




/// MARK: - 设置默认Layer
- (void)setDefaultLayer
{
    [self setDefaultShadow];
    self.layer.cornerRadius = 5;
    self.layer.borderColor  = @"#CCCCCC".color.CGColor;
    self.layer.borderWidth  = 0.3;
    self.clipsToBounds = YES;
    
}



/// MARK: - 设置默认Shadow
- (void)setDefaultShadow
{
    
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(2,2);
    self.layer.shadowOpacity = 0.4;
    self.layer.shadowRadius = 2;//阴影半径，默认3
}



/// MARK: - 设置Layer; borderColor:边框颜色; borderwinth:边框大小; cornerRadius:设置圆角; clipsToBounds:去除多余圆角
- (void)setBorderColor:(UIColor *)borderColor andBorderwinth:(CGFloat)borderwinth andCornerRadius:(CGFloat)cornerRadius andClipsToBounds:(BOOL)clipsToBounds
{
    if (borderColor ) {
        self.layer.borderColor  = borderColor.CGColor;
    }
    
    self.layer.borderWidth  = borderwinth;
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds      = clipsToBounds;
}



/// MARK: - 设置Shadow; shadowColor:阴影颜色; shadowOffset:阴影偏移; shadowOpacity:阴影透明度; shadowRadius:阴影半径; cornerRadius:半径
- (void)setShadowColor:(UIColor *)shadowColor andShadowOffset:(CGSize)shadowOffset
andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius andCornerRadius:(CGFloat)cornerRadius
{
    if (shadowColor ) {
        self.layer.shadowColor   = shadowColor.CGColor;
    }
    
    self.layer.shadowOffset  = shadowOffset ;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius  = shadowRadius ;
    self.layer.cornerRadius  = cornerRadius ;
}


/// MARK: - 设置Shadow; shadowColor:阴影颜色; shadowOffset:阴影偏移; shadowOpacity:阴影透明度; shadowRadius:阴影半径; cornerRadius:半径; borderColor:边框颜色; borderwinth:边框大小
- (void)setShadowColor:(UIColor *)shadowColor andShadowOffset:(CGSize)shadowOffset
andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius andCornerRadius:(CGFloat)cornerRadius andBorderColor:(UIColor *)borderColor andBorderwinth:(CGFloat)borderwinth

{
    
    [self setShadowColor:shadowColor andShadowOffset:shadowOffset andShadowOpacity:shadowOpacity andShadowRadius:shadowRadius andCornerRadius:cornerRadius];
    if (borderColor ) {
        self.layer.borderColor   = borderColor.CGColor;
    }
    
    self.layer.borderWidth   = borderwinth;
}



@end
