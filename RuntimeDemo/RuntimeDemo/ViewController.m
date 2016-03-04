//
//  ViewController.m
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/24.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+AssociatedObjects.h"
#import "CircleView.h"
#import "LCCircleViewlayer.h"
@interface ViewController ()
@property (nonatomic, strong) LCCircleViewlayer *layer;
@end

__weak NSString *string_weak_assign = nil;
__weak NSString *string_weak_retain = nil;
__weak NSString *string_weak_copy   = nil;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CircleView *circle = [[CircleView alloc]init];
//    circle.frame = CGRectMake(50, 50, 100, 100);
//    circle.backgroundColor = [UIColor whiteColor];
//    
//    [self.view addSubview:circle];
//   self.associatedObject_assign = @"luocheng";
//    
//    self.associatedObject_retain = @"luocheng2222";
//    
//    self.associatedObject_copy = @"luocheng3333";
//    
//    
//    string_weak_assign = self.associatedObject_assign;
//    string_weak_retain = self.associatedObject_retain;
//    string_weak_copy   = self.associatedObject_copy;
    
    
    LCCircleViewlayer *layer = [[LCCircleViewlayer alloc]init];
    layer.frame =CGRectMake(50,100,100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.progressColor = [UIColor greenColor];
    layer.tintColor = [UIColor whiteColor];
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
    [self.view addGestureRecognizer:tap];
    [timer fire];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)move:(UITapGestureRecognizer *)tap {
    
    self.layer.progress = 1.0f;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    CABasicAnimation* animat = [CABasicAnimation animationWithKeyPath:@"progress"];
    animat.duration =6.f;
    animat.fromValue = [NSNumber numberWithFloat:[(LCCircleViewlayer*)[self.layer presentationLayer] progress]];
    animat.toValue = [NSNumber numberWithFloat:1.0f];
    animat.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:animat forKey:@"gogogo"];
    [CATransaction commit];

}

- (void)updateUI {

    NSDate *now = [NSDate date];
    int  _timestamp = [now timeIntervalSince1970];

    


}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    NSLog(@"self.associatedObject_retain: %@", self.associatedObject_retain);
//    NSLog(@"self.associatedObject_copy:   %@", self.associatedObject_copy);
//     NSLog(@"self.associatedObject_copy:   %@", self.associatedObject_assign);
//
//}






@end
