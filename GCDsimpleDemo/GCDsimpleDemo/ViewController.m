//
//  ViewController.m
//  GCDsimpleDemo
//
//  Created by 罗成 on 15/11/29.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (nonatomic, strong) NSArray *array;
@end

@implementation ViewController

- (NSArray *)array {

    if (_array == nil) {
        _array = [[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    }

    return _array;

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    NSLog(@"1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        for (NSString *str in self.array) {
            NSLog(@"%@",str);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.btn.hidden = NO;
        });
    });
    
//    
//    for (NSString *str in self.array) {
//        NSLog(@"%@",str);
//        self.btn.hidden = NO;
//    }
    
    
    
    

    NSLog(@"%@",self.array);
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
