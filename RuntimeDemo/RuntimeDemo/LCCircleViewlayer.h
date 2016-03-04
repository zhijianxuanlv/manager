//
//  LCCircleViewlayer.h
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface LCCircleViewlayer : CALayer

@property(nonatomic ,assign)CGFloat progress;
@property(nonatomic, strong)UIColor *progressColor;
@property(nonatomic, strong)UIColor *tintColor;
@end
