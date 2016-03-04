//
//  ViewController.m
//  UIBezierPathDemo
//
//  Created by 罗成 on 16/2/24.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "ViewController.h"
#import "CustomerView.h"
@interface ViewController ()
@property (nonatomic, strong) UIImageView *topImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CustomerView *view = [[CustomerView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
    bgView.backgroundColor = [UIColor  redColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    self.topImageView = imageView;
    imageView.backgroundColor = [UIColor grayColor];
    
    imageView.image = [UIImage imageNamed:@"1.JPG"];
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    imageView.clipsToBounds = YES;
    [bgView addSubview:imageView];
    
    
    [self.tableView insertSubview:bgView atIndex:0];
    
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
   
    self.tableView.tableFooterView = [[UIView alloc]init];
//    [self setupUI];
    
    __block int a = 100;
    
    void (^success)(void) = ^{
        
        a = 1;
        
    };
    
    success();
    
    NSLog(@"==>2");
    
    NSLog(@"====>%d",a);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setupUI {

    UIRefreshControl *control=[[UIRefreshControl alloc]init];
    control.tintColor = [UIColor whiteColor];
    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:control];

}

- (void)refreshStateChange:(UIRefreshControl *)control {

    [control endRefreshing];

}

#pragma mark UITvableViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {


    CGFloat offset_Y = self.tableView.contentOffset.y;
    CGFloat delta = 300 + offset_Y;    //相对偏移量
    
  
    //上拉
    if (offset_Y > -64) {
        
        CGRect frame = self.topImageView.frame;
        frame.origin.y = offset_Y + 64;
        frame.size.height = delta;
        self.topImageView.frame = frame;
        
    }else {
      NSLog(@"==>%f",offset_Y);
        CGRect frame = self.topImageView.frame;
        frame.size.width = self.view.frame.size.width - (delta)/2;
        frame.size.height = delta;
        frame.origin.y = offset_Y + 64;
        frame.origin.x = delta / 4;
        self.topImageView.frame = frame;
    
    
    }
    
    

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
