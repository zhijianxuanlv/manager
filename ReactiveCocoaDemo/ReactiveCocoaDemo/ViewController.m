//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by 罗成 on 15/11/24.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
