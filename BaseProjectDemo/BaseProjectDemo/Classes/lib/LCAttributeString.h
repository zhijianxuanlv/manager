//
//  LCAttributeString.h
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/23.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCAttributeString : NSObject

+ (NSMutableAttributedString *) boldStringWith:(NSString *)string fontSize:(CGFloat)fontSize unitString:(NSString *)unitString;

+ (NSMutableAttributedString *) boldStringWith:(NSString *)string unitString:(NSString *)unitString;
@end
