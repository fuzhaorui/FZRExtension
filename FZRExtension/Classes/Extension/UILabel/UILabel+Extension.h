//
//  UILabel+Extension.h
//  FZRExtension
//
//  Created by fuzhaorui on 16/9/1.
//

#import <UIKit/UIKit.h>

@interface UILabel (MyExtension)

/// MARK: - 将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontFloatArray:返回字符串字体大小数组
- (void)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontFloatArray:(NSArray *)fontFloatArray;


/// MARK:- 将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontArray:返回字符串字体数组
- (void)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontArray:(NSArray *)fontArray;

@end
