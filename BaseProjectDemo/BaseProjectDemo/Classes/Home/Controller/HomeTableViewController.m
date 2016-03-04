//
//  HomeTableViewController.m
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/22.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "HomeTableViewController.h"
#import "Newhand.h"
#import "InvestModel.h"
#import "TransferModel.h"
#import "Bannel.h"
#import "SDCycleScrollView.h"
@interface HomeTableViewController ()

@property (nonatomic, strong) NSMutableArray *bannerArray;
@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation HomeTableViewController

- (NSMutableArray *)bannerArray {

    if (_bannerArray == nil) {
        _bannerArray = [NSMutableArray array];
    }
    return _bannerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadNewData {

    [LCRequestManager postWithURL:@"appIndex/list" params:nil successBlock:^(id json) {
        if (responseOK) {
           
            [self.dataArray removeAllObjects];
            
            [self.dataArray addObject:[Newhand objectArrayWithKeyValuesArray:json[@"newHands"]]];
            [self.dataArray addObject:[InvestModel objectArrayWithKeyValuesArray:json[@"investInfo"]]];
            [self.dataArray addObject:[TransferModel objectArrayWithKeyValuesArray:json[@"transferInfo"]]];
            
            [self.bannerArray removeAllObjects];
            
            [self.bannerArray addObjectsFromArray: [Bannel objectArrayWithKeyValuesArray:json[@"bannel"]]];
            
            [self setAd];
            [self.tableView.header endRefreshing];

            [self.tableView reloadData];
        }
        
    } failureBlock:^(NSError *error) {
    
    }];
}

- (void)setAd {
    NSMutableArray *array = [NSMutableArray array];
    for (Bannel *bannel in self.bannerArray) {
        NSString *urlString = [NSString stringWithFormat:@"http://116.236.220.210:8086/staticCacheImg/images/%@", bannel.imgurl];
        [array addObject:urlString];
    }
    [self.bannerView setImageURLStringsGroup:array];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.dataArray [section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID1 = @"experienceCell";
    static NSString *ID2 = @"investCell";
    static NSString *ID3 = @"transferCell";
    
    id obj = self.dataArray[indexPath.section][indexPath.row];
    
    UITableViewCell *cell;
    
    if ([obj isKindOfClass:[Newhand class]]){
        cell = [tableView dequeueReusableCellWithIdentifier:ID1 forIndexPath:indexPath];
    } else if ([obj isKindOfClass:[InvestModel class]] ) {
        cell = [tableView dequeueReusableCellWithIdentifier:ID2 forIndexPath:indexPath];
    } else  {
        cell = [tableView dequeueReusableCellWithIdentifier:ID3 forIndexPath:indexPath];
    }
    [cell setValue:obj  forKey:@"baseModel"];
    
    return cell;
}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    id obj = self.dataArray[indexPath.section][indexPath.row];
//    if ([obj isKindOfClass:[Newhand class]]){
//        DebugLog(@"新手项目");
//    } else if ([obj isKindOfClass:[InvestModel class]] ) {
//
//        
//    } else  {
//
//    }
//}
//
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 215.0;
}
//
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    DebugLog(@"click ==> %@", self.bannerArray[index]);
}



@end
