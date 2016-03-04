//
//  LCCricleProgressView.m
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/25.
//  Copyright © 2015年 罗成. All rights reserved.
//
// 获得RGB颜色
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kCircleSegs 100
#import "LCCircleProgressView.h"

@implementation LCCircleProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initUI];
    }
    return self;
}

- (void)initUI{

    
}


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float radius = CGRectGetWidth(rect)/2.0f - self.circleBorderWidth/2.0f;
    
    CGContextSetLineWidth(context, self.circleBorderWidth);
    
    CGContextBeginPath(context);
    
    CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), radius,  -M_PI_2, self.progress/(float)self.num*M_PI*2 -M_PI_2, 0);
    CGContextSetStrokeColorWithColor(context, self.circleColor.CGColor);
    
    CGContextStrokePath(context);

    if (self.progress != kCircleSegs) {
        
         CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), radius,  -M_PI_2, self.progress/(float)self.num*M_PI*2 -M_PI_2, 0);
       CGContextSetStrokeColorWithColor(context, self.noneColor.CGColor);
        
        CGContextStrokePath(context);
    }
}

- (void)setProgressWithNumAndCircleColorAndNoneColorAndcircleBorderWidth:(CGFloat)progress num:(int)num circleColor:(UIColor *)circleColor noneColor:(UIColor *)noneColor circleBorderWidth:(CGFloat)circleBorderWidth {

    self.progress = progress;
    self.num = num;
    self.circleColor = circleColor;
    self.noneColor = noneColor;
    self.circleBorderWidth = circleBorderWidth;
    
    [self setNeedsDisplay];
}





@end
