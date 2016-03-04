//
//  LCCricleProgressView.h
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCCircleProgressView : UIView

@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic, strong) UIColor *noneColor;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat circleBorderWidth;
@property (nonatomic, assign) int num;
- (void)setProgressWithNumAndCircleColorAndNoneColorAndcircleBorderWidth:(CGFloat)progress num:(int)num circleColor:(UIColor *)circleColor noneColor:(UIColor *)noneColor circleBorderWidth:(CGFloat)circleBorderWidth;

@end
