//
//  BaseTableViewController.h
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/22.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
@interface BaseTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)loadNewData;

@end
