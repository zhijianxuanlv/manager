//
//  LCAttributeString.m
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/23.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "LCAttributeString.h"
#define UnitFont [UIFont systemFontOfSize:12.0]
#define MainFontSize 18.0
@implementation LCAttributeString

+ (NSMutableAttributedString *) boldStringWith:(NSString *)string fontSize:(CGFloat)fontSize unitString:(NSString *)unitString {
    //先把两个字符串拼接起来
    NSString *totalString = [NSString stringWithFormat:@"%@%@",string,unitString];
    NSRange range = [totalString rangeOfString:string];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontSize] range:range];
    if (attributedStr == nil || unitString.length == 0) {
        
    } else {
        
        NSRange unitRanage  = [totalString rangeOfString:unitString];
        
        [attributedStr addAttribute:NSFontAttributeName value:UnitFont range:unitRanage];
    
    }
    return attributedStr;
}

+ (NSMutableAttributedString *) boldStringWith:(NSString *)string unitString:(NSString *)unitString {

   return  [self boldStringWith:string fontSize:MainFontSize unitString:unitString];

    
}

@end
