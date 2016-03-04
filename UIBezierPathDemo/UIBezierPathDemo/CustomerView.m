//
//  CustomerView.m
//  UIBezierPathDemo
//
//  Created by 罗成 on 16/2/24.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "CustomerView.h"

@implementation CustomerView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setUI];
        
    }
    return self;

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
       
        [self setUI];
        

    }

    return self;

}

- (void)setUI {

    self.backgroundColor = [UIColor redColor];
    [self setView];
//    self.layer.mask = [self createMenuShapeLayerWithFrame:self.bounds];


}

- (void)setView {



}


- (CAShapeLayer *)createMenuShapeLayerWithFrame:(CGRect)frame {

    UIBezierPath *path = [self creatMaskPathWithFrame:frame];
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = path.CGPath;
    return shapLayer;

}

- (UIBezierPath *)creatMaskPathWithFrame:(CGRect)frame {

    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    //设置线头的样式
    path.lineCapStyle = kCGLineCapRound;
    //设置连接的样式
    path.lineJoinStyle = kCGLineJoinRound;
    
    //起点
    [path moveToPoint:CGPointMake(frame.origin.x, 30)];
    
    //
    [path addQuadCurveToPoint:CGPointMake(frame.size.width, 30) controlPoint:CGPointMake(frame.size.width /2, 0)];
    
    [path addLineToPoint:CGPointMake(frame.size.width, frame.size.height)];
    
    [path addLineToPoint:CGPointMake(frame.origin.x, frame.size.height)];
    
    [path addLineToPoint:CGPointMake(frame.origin.x, 30)];
    
    return path;
}

- (void)drawRect:(CGRect)rect {
    
    
    CGRect frame = self.bounds;
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线头的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, 2.0f);
    //开始绘制
    CGContextBeginPath(context);
    CGContextSetRGBStrokeColor(context, 255.0, 255.0, 255.0, 1.0f);
    CGContextMoveToPoint(context, frame.origin.x, 30);
    CGContextAddQuadCurveToPoint(context, frame.size.width/ 2, 60 ,frame.size.width, 30);
    NSLog(@"cx = %f ,cy = %f ,x = %f , y = %f",frame.size.width/ 2, 0.0,frame.size.width,30.0);
    
    
    //    CGContextAddArcToPoint(context, frame.origin.x, 30, frame.size.width, 30, 2);
    CGContextAddLineToPoint(context, frame.size.width, frame.size.height);
    CGContextAddLineToPoint(context, frame.origin.x, frame.size.height);
    CGContextAddLineToPoint(context, frame.origin.x, 30);
    CGContextStrokePath(context);
    
}





@end
