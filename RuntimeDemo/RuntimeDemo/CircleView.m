//
//  CircleView.m
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "CircleView.h"
@implementation CircleView


- (id)init {

    if (self = [super init]) {
        
    }

    return self;

}

- (id)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
       
        
    }
    return self;

}

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;


}



//画图
- (void)drawRect:(CGRect)rect {
    // 获取上下文
    // 填充的三角形
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGContextSetLineWidth(ctx, 3.0);
//    
//    [[UIColor blackColor] set];//线的颜色
//    
//    CGContextMoveToPoint(ctx, 10, 10);// x，y  开始坐标
//    
//    CGContextAddLineToPoint(ctx, 10, 90);// 终点坐标
//    
//    CGContextAddLineToPoint(ctx, 90, 90);// 终点坐标
//    
//    CGContextAddLineToPoint(ctx, 10, 10);
//    
//    CGContextSetLineJoin(ctx,kCGLineJoinRound);
//    
//    
//    [[UIColor redColor] setFill]; //设置要填充颜色。
//    
//    CGContextMoveToPoint(ctx, 90, 90);// x，y  开始坐标
//    
//    CGContextAddLineToPoint(ctx, 170, 90);// 终点坐标
//    
//    CGContextAddLineToPoint(ctx, 170, 10);// 终点坐标
//    
//    CGContextAddLineToPoint(ctx, 90, 90);
//    [[UIColor greenColor] setFill];
//    
//    CGContextClosePath(ctx);
//    
////    CGContextStrokePath(ctx);// 没有填充颜色
//    CGContextDrawPath(ctx, kCGPathFillStroke);//包含填充颜色
    
    
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(ctx, 2.0);
//    [[UIColor blackColor] set];
//    CGContextMoveToPoint(ctx, 10, 10);
//    CGContextAddCurveToPoint(ctx, 200, 50, 100, 400, 300, 400);
//    
//    CGContextStrokePath(ctx);
    
//     填充的圆形
    
        CGContextRef ctx = UIGraphicsGetCurrentContext();
//        CGContextMoveToPoint(ctx, 50, 50);
        CGRect Rect = self.bounds;
    
        CGFloat Radius = CGRectGetHeight(Rect)/2.0f;
        CGFloat centerX = CGRectGetWidth(rect) * 0.5;
        CGFloat centerY = CGRectGetHeight(rect) * 0.5;
    
        CGContextMoveToPoint(ctx, centerX , centerY);
         CGContextMoveToPoint(ctx, centerX , 2 *centerY);
    
    
    
        [[UIColor redColor] setFill];
    
        CGContextSetLineWidth(ctx, 1.0);
        CGContextAddArc(ctx, centerX, centerY, CGRectGetHeight(Rect) / 2.0f - 1.0 / 2.0 , (CGFloat) -M_PI_2, (CGFloat) (-M_PI_2 + M_PI * 2), 0);
        CGContextStrokePath(ctx);
   
}



- (void)layoutSubviews {





}



@end














