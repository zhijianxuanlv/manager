//
//  LCCircleView.h
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCCircleView : UIView
@property (strong,nonatomic) UIColor *progressTintColor;
@property (strong,nonatomic) UIColor *borderTintColor;
@property (nonatomic) CGFloat *progress;
//@property (nonatomic, strong) CABasicAnimation *animation;
//- (void)setProgress:(CGFloat *)progress;
@end
