//
//  LcViewController.m
//  CollectionDemo
//
//  Created by 罗成 on 15/11/30.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "LcViewController.h"

@interface LcViewController ()
@property (nonatomic, strong) NSString *username;
@end

@implementation LcViewController

- (instancetype)initWithTitle:(NSString *)title username:(NSString *)username {

    if (self = [super init]) {
        
        self.title = title;
        self.username = username;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
