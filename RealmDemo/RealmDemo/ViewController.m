//
//  ViewController.m
//  RealmDemo
//
//  Created by 罗成 on 16/1/4.
//  Copyright © 2016年 罗成. All rights reserved.
//
#define aRGBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#import "ViewController.h"
#import "CustomerCell.h"
#import "TalkModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface ViewController ()<UITextFieldDelegate,CustomerCellDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) UITextField *field;
@property (nonatomic, strong) UITextField *inputField;
@property (nonatomic, weak) UIView *inputFieldView;

@end

@implementation ViewController

- (NSMutableArray *)dataArray {

    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    [self creatinputField];
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm beginWriteTransaction];
//    
//    
//    for (int i = 0; i < 10; i ++) {
//        TalkModel *talk = [[TalkModel alloc]init];
//        
//        
//        if (i % 3 == 0) {
//            talk.title = @"天气真好cell 中的内容是动态的的时侯经常会遇到这样的需使用";
//            talk.comment = @"在使用 table view 的时侯经常会遇到这样的需求：table view 的 cell 中的内容是动态的，导致在开发的时候不知道一个 cell 的高度具体是多少 高度的算法，在每次加载到这个。";
//        }else {
//            talk.title = @"天气真好";
//            talk.comment = @"iOS 8 自适应 Cell";
//        
//        }
//        [realm addObject:talk];
//        [self.dataArray addObject:talk];
//    }
//    [realm commitWriteTransaction];
    self.tableView.fd_debugLogEnabled = YES;
    //获取Documents路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path= [paths objectAtIndex:0];
    NSLog(@"path:%@",path);
    
    RLMResults *results = [TalkModel allObjects];
    for (TalkModel *talk  in results) {
        [self.dataArray addObject:talk];
    }

}

- (void)creatinputField {
   CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    UITextField *inputField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, screenW - 10, 34)];
//    inputField.backgroundColor = [UIColor greenColor];
    inputField.returnKeyType = UIReturnKeySend;
    inputField.borderStyle = UITextBorderStyleRoundedRect;
    inputField.delegate = self;
    inputField.enablesReturnKeyAutomatically = YES;
    [view addSubview:inputField];
    view.backgroundColor  = [UIColor grayColor];
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = [aRGBColor(0, 0, 0, 0.1) CGColor];
    
    //view 的位置保持在键盘的上方
    UITextField *filed = [[UITextField alloc]init];
    filed.backgroundColor = [UIColor redColor];
    filed.inputAccessoryView = view;
    self.field = filed;
    self.inputField = inputField;
    [self.view addSubview:filed];
    
    
    self.inputFieldView = view;
    
    [self.inputField becomeFirstResponder];
    [self.field becomeFirstResponder];
   
    //增加单击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
    [self.view addGestureRecognizer:tap];
    
}

//获取c点击回复ell的位置
- (void)adjustFrameWithCell:(UITableViewCell *)cell {
    //获取cell在当前window 的位置

    CGRect cellFrame = [cell convertRect:cell.bounds toView:[UIApplication sharedApplication].keyWindow];
    //获取弹出键盘的位置
    CGRect inputViewFrame = [self.inputFieldView convertRect:self.inputView.bounds toView:[UIApplication sharedApplication].keyWindow];
    //获取cell在屏幕上的尺寸
    CGFloat cellButton = CGRectGetMaxY(cellFrame);
    CGPoint point = CGPointMake(0, - inputViewFrame.origin.y + cellButton + self.tableView.contentOffset.y);

    

    [UIView animateWithDuration:0.25 animations:^{
        [self.tableView setContentOffset:point];
    }];
   
    [self.inputField becomeFirstResponder];
}

- (void)hideView{
    [self.field resignFirstResponder];
    [self.inputField resignFirstResponder];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


#pragma mark tableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomerCell" forIndexPath:indexPath];
    cell.delegate = self;
    TalkModel *talk = self.dataArray [indexPath.row];
    cell.talkModel = talk;
    cell.fd_enforceFrameLayout = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [tableView fd_heightForCellWithIdentifier:@"CustomerCell" configuration:^(CustomerCell *cell) {
       TalkModel *talk = self.dataArray [indexPath.row];
        cell.talkModel = talk;
    }];

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44;

}

- (void)cellWithOnclick:(CustomerCell *)cell {
    [self.inputField becomeFirstResponder];
    [self.field becomeFirstResponder];
    [self adjustFrameWithCell:cell];
    
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];
    [self hideView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

//    [self hideView];
}
@end
