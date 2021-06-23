//
//  UIColor+Extension.m
//  PDDIOSRE
//
//  Created by fuzhaorui on 2019/7/22.
//

#import "UIColor+Extension.h"

@implementation UIColor (MyExtension)

/// MARK: - UIColor 转 UIImage
- (UIImage *)image
{
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
    
}


/// MARK: - UIColor 转 十六进制NSString（#FFFFFF）
- (NSString *)hexadecimalFromUIColor{
    
    UIColor *color = self;
    
    if(CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components =CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }

    if(CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) !=kCGColorSpaceModelRGB) {

        return [NSString stringWithFormat:@"#FFFFFF"];

    }

    NSString *r,*g,*b;

    (int)((CGColorGetComponents(color.CGColor))[0]*255.0) == 0?(r =[NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[0]*255.0)]):(r= [NSString stringWithFormat:@"%x",(int)((CGColorGetComponents(color.CGColor))[0]*255.0)]);

    (int)((CGColorGetComponents(color.CGColor))[1]*255.0)== 0?(g = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[1]*255.0)]):(g= [NSString stringWithFormat:@"%x",(int)((CGColorGetComponents(color.CGColor))[1]*255.0)]);

    (int)((CGColorGetComponents(color.CGColor))[2]*255.0)== 0?(b = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[2]*255.0)]):(b= [NSString stringWithFormat:@"%x",(int)((CGColorGetComponents(color.CGColor))[2]*255.0)]);

    return [NSString stringWithFormat:@"#%@%@%@",r,g,b];

}


@end
