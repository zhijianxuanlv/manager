//
//  MainViewController.m
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/20.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = RGB_COLOR(245, 61, 61);
        BaseNavViewController *home = [[UIStoryboard storyboardWithName:@"Home" bundle:nil]instantiateInitialViewController];
        BaseNavViewController *invest = [[UIStoryboard storyboardWithName:@"Invest" bundle:nil]instantiateInitialViewController];
        BaseNavViewController *transfer = [[UIStoryboard storyboardWithName:@"Transfer" bundle:nil]instantiateInitialViewController];
        BaseNavViewController *me = [[UIStoryboard storyboardWithName:@"Me" bundle:nil]instantiateInitialViewController];
        BaseNavViewController *setting = [[UIStoryboard storyboardWithName:@"Setting" bundle:nil]instantiateInitialViewController];
    
    [self addChildViewController:home];
    [self addChildViewController:invest];
    [self addChildViewController:transfer];
    [self addChildViewController:me];
    [self addChildViewController:setting];
    
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
