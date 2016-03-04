//
//  UIImage+image.h
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/20.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;


@end
