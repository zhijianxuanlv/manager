//
//  LCCircleView.m
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "LCCircleView.h"

@implementation LCCircleView


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {

}

- (void)setProgress:(CGFloat *)progress {

    _progress = progress;



}




@end
