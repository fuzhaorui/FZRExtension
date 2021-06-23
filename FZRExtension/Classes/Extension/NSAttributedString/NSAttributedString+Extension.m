//
//  NSAttributedString+Extension.m
//  PDDIOSRE
//
//  Created by fuzhaorui on 2019/11/8.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (MyExtension)

/// MARK: -将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontFloatArray:返回字符串字体大小数组
+ (NSAttributedString *)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontFloatArray:(NSArray *)fontFloatArray
{
    
    NSInteger length=0;
    NSString *str1;
    for (int i=0;  i<stringArray.count;  i++)
    {
        if (i==0) {
            str1= [NSString stringWithFormat:@"%@",stringArray[i]];
        }
        else
        {
            str1 = [NSString stringWithFormat:@"%@%@",str1,stringArray[i]];
        }
        
    }
    NSMutableAttributedString *mutableAttributedString =[[NSMutableAttributedString alloc]initWithString:str1];
    
    for (int i=0;  i<stringArray.count;  i++) {
        
        NSString *str = stringArray[i];
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:NSMakeRange(length,str.length)];
        
        [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:[fontFloatArray[i] doubleValue]] range:NSMakeRange(length, str.length)];
        length = length+str.length;
        
        
    }

    
    return mutableAttributedString;
}


/// MARK:- 将label赋值自定义字符串; label:赋值自定义字符串的Label; stringArray:返回要展示的字符串数组; colorArray:返回字符串颜色数组; fontArray:返回字符串字体数组
+ (NSAttributedString *)attributedStringArray:(NSArray *)stringArray andColorArray:(NSArray *)colorArray andFontArray:(NSArray *)fontArray
{
    NSInteger length=0;
    NSString *str1;
    for (int i=0;  i<stringArray.count;  i++)
    {
        if (i==0) {
            str1= [NSString stringWithFormat:@"%@",stringArray[i]];
        }
        else
        {
            str1 = [NSString stringWithFormat:@"%@%@",str1,stringArray[i]];
        }
        
    }
    NSMutableAttributedString *mutableAttributedString =[[NSMutableAttributedString alloc]initWithString:str1];
    
    for (int i=0;  i<stringArray.count;  i++) {
        
        NSString *str = stringArray[i];
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:NSMakeRange(length,str.length)];
        
        [mutableAttributedString addAttribute:NSFontAttributeName value:fontArray[i] range:NSMakeRange(length, str.length)];
        length = length+str.length;
        
        
    }
    
    return  mutableAttributedString;
    
}

@end
