//
//  LCCircleViewlayer.m
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "LCCircleViewlayer.h"

@implementation LCCircleViewlayer

+(BOOL)needsDisplayForKey:(NSString *)key {

    NSLog(@"__%s__ %@",__FUNCTION__,key);
     return [key isEqualToString:@"progress"]?YES:[super needsDisplayForKey:key];

}

- (void)drawInContext:(CGContextRef)ctx {

    CGContextSetLineWidth(ctx, 5.0f);
    
    
    CGContextSetStrokeColorWithColor(ctx, self.progressColor.CGColor);
   
    [self.progressColor set];
    CGContextAddArc(ctx,CGRectGetWidth(self.bounds)/2.,CGRectGetHeight(self.bounds)/2.,CGRectGetWidth(self.bounds)/2. - 6, M_PI_2 * 3,M_PI_2*3+M_PI*2*1,0);
    
    CGContextStrokePath(ctx);
    
    
    CGContextSetStrokeColorWithColor(ctx, self.tintColor.CGColor);
     [self.tintColor set];
    CGContextAddArc(ctx,CGRectGetWidth(self.bounds)/2.,CGRectGetHeight(self.bounds)/2.,CGRectGetWidth(self.bounds)/2. - 6, M_PI_2 * 3,M_PI_2*3+M_PI*2*self.progress,0);
    CGContextStrokePath(ctx);
    
    
}




@end
