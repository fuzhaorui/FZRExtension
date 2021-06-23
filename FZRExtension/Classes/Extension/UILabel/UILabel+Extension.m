//
//  UILabel+Extension.m
//  sender
//
//  Created by fuzhaorui on 16/9/1.
//

#import "UILabel+Extension.h"
#import "NSAttributedString+Extension.h"

@implementation UILabel (MyExtension)


/// MARK: -将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontFloatArray:返回字符串字体大小数组
- (void)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontFloatArray:(NSArray *)fontFloatArray
{
    
    self.attributedText = [NSAttributedString attributedStringArray:stringArray andColorArray:colorArray andFontFloatArray:fontFloatArray];
    
    
}


/// MARK:- 将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontArray:返回字符串字体数组
- (void)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontArray:(NSArray *)fontArray
{

    self.attributedText = [NSAttributedString attributedStringArray:stringArray andColorArray:colorArray andFontArray:fontArray];
}

@end
