//
//  InvestTableController.m
//  Bel
//
//  Created by Leon on 16/2/20.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "InvestTableController.h"
#import "MJRefresh.h"
#import "InvestModel.h"
#import "InvestStatusInCell.h"
#import "InvestOtherStatusCell.h"


@interface InvestTableController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;//默认按钮
@property (weak, nonatomic) IBOutlet UIButton *incomeBtn;//收益率按钮
@property (weak, nonatomic) IBOutlet UIButton *discountBtn;//期限按钮

- (IBAction)defaultAction:(id)sender;
- (IBAction)incomeAction:(id)sender;
- (IBAction)discountAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *incomeImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *discountImageBtn;
@property (nonatomic, assign) NSInteger incomeFlag;
@property (nonatomic, assign) NSInteger discountFlag;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) MJRefreshAutoNormalFooter *footer;
@property (nonatomic, strong) MJRefreshAutoNormalFooter *nilFooter;
@property (nonatomic, strong) UIView *emptyView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic) NSInteger pageNo;
@property (nonatomic) NSInteger pageSize;

@property (nonatomic, strong) NSDictionary *param;

@end

@implementation InvestTableController

- (UIView *)emptyView{
    if (!_emptyView) {
        UIView *view =  [[UIView alloc] initWithFrame:self.tableView.bounds];
        UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
        label.text = @"暂无数据";
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        _emptyView = view;
    }
    return _emptyView;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNo = 1;
    self.pageSize = 20;
    
    [self.incomeImageBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [self.discountImageBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [self.defaultBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    self.param = @{
                   @"page" : @(self.pageNo),
                   @"rows" : @(self.pageSize)
                   };
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    // 马上进入刷新状态
    [header beginRefreshing];
    
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.footer = footer;
    // 禁止自动加载
    //    footer.automaticallyRefresh = NO;
    
    // 设置header
    self.tableView.header = header;
    
    // 设置footer
    self.tableView.footer = footer;

}

- (void)loadData {
    //overide
    if (self.tableView.header.isRefreshing) {
        self.pageNo = 1;
    } else {
        self.pageNo++;
    }
    

    
    [LCRequestManager postWithURL:@"appInvest/appInvestList" params:self.param successBlock:^(id json) {
        NSArray *dataArray = @[];
        if (responseOK) {
            
            //获取数据
            dataArray = [InvestModel objectArrayWithKeyValuesArray:json[@"data"]];
            //如果是下拉刷新, 先清空所有的数据
            if (self.tableView.header.isRefreshing) {
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:dataArray];
        }
        
        if(self.dataArray.count == 0) {
            DebugLog(@"没有数据....");
            self.tableView.tableFooterView = self.emptyView;
        }
        
        if (self.tableView.header.isRefreshing) {
            [self.tableView.header endRefreshing];
        } else {
            [self.tableView.footer endRefreshing];
        }
        
        if (dataArray.count == self.pageSize){
            self.tableView.footer = self.footer;
        } else {
            self.tableView.footer = self.nilFooter;
        }
        //停止刷新
        [self.tableView reloadData];
    } failureBlock:^(NSError *error) {
        DebugLog(@"error => %@", error.debugDescription);
        //停止刷新
        if (self.tableView.header.isRefreshing) {
            [self.tableView.header endRefreshing];
        } else {
            [self.tableView.footer endRefreshing];
        }
    }];
    
    
    
    
    
//    [self setButtonState];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InvestModel *invest = self.dataArray[indexPath.section];
    if (invest.tradeStatus == TRADE_STATUS_IN) {
        InvestStatusInCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InvestStatusInCell" forIndexPath:indexPath];
        cell.invest = invest;
        return cell;
    } else  {
        InvestOtherStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InvestOtherStatusCell" forIndexPath:indexPath];
        cell.invest = invest;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (IBAction)defaultAction:(id)sender {
    [self setButtonState];
    
    _param = @{
                            @"page" : @(self.pageNo),
                            @"rows" : @(self.pageSize)
                            };
    [self.defaultBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.tableView.header beginRefreshing];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    InvestModel *invest = self.dataArray[indexPath.section];
//    [self performSegueWithIdentifier:@"investInfoSegue" sender:invest];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
}



- (void)setButtonState {
    
    [self.incomeImageBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [self.discountImageBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [self.incomeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.discountBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

- (IBAction)incomeAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.discountBtn.selected = NO;
    btn.selected = !btn.selected;
    
    if (self.discountFlag == 1) {
        [self.discountImageBtn setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    }
    if (self.discountFlag == 2) {
        [self.discountImageBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    }
    
    self.pageNo = 1;
    if (btn.selected) {
        self.param = @{@"page":@(self.pageNo),
                  @"rows":@(self.pageSize),
                  @"investRate":@(1),
                  @"signature":@""};
        
        [self.incomeImageBtn setBackgroundImage:[UIImage imageNamed:@"up_select"] forState:UIControlStateNormal];
        self.incomeFlag = 1;
        
    }else {
        self.param = @{@"page":@(self.pageNo),
                  @"rows":@(self.pageSize),
                  @"investRate":@(2),
                  @"signature":@""};
        
        [self.incomeImageBtn setBackgroundImage:[UIImage imageNamed:@"down_select"] forState:UIControlStateNormal];
        
        self.incomeFlag = 2;
    }
    [self.incomeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.discountBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.defaultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.tableView.header beginRefreshing];
}

- (IBAction)discountAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.incomeBtn.selected = NO;
    self.discountBtn.titleLabel.textColor = [UIColor redColor];
    if (self.incomeFlag == 1) {
        [self.incomeImageBtn setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
        
    }
    if (self.incomeFlag == 2) {
        [self.incomeImageBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    }
    
    btn.selected = !btn.selected;
    self.pageNo = 1;
    if (btn.selected) {
        
        self.param = @{@"page":@(self.pageNo),
                  @"rows":@(self.pageSize),
                  @"periods":@(1),
                  @"signature":@""};
        
        
        [self.discountImageBtn setBackgroundImage:[UIImage imageNamed:@"up_select"] forState:UIControlStateNormal];
        self.discountFlag = 1;
        
        
    }else {
        
        self.param = @{@"page":@(self.pageNo),
                  @"rows":@(self.pageSize),
                  @"periods":@(2),
                  @"signature":@""};
        [self.discountImageBtn setBackgroundImage:[UIImage imageNamed:@"down_select"] forState:UIControlStateNormal];
        
        self.discountFlag = 2;
    }
    
    [self.discountBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.incomeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.defaultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.tableView.header beginRefreshing];
}


@end
