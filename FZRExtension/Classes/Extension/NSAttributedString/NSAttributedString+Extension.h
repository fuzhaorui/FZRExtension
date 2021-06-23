//
//  NSAttributedString+Extension.h
//  PDDIOSRE
//
//  Created by fuzhaorui on 2019/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (MyExtension)

/// MARK: - 将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontFloatArray:返回字符串字体大小数组
+ (NSAttributedString *)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontFloatArray:(NSArray *)fontFloatArray;


/// MARK:- 将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontArray:返回字符串字体数组
+ (NSAttributedString *)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontArray:(NSArray *)fontArray;

@end

NS_ASSUME_NONNULL_END
