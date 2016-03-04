//
//  ViewController.m
//  CollectionDemo
//
//  Created by 罗成 on 15/11/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "LcViewController.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CollectionViewCellDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *dataArray;
- (IBAction)onClick:(id)sender;

@end

@implementation ViewController

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSArray array];
    }

    return _dataArray;
}

- (IBAction)onClick:(id)sender {
   LcViewController *lcview = [[LcViewController alloc]initWithTitle:@"第二天" username:@"罗成"];
    [self.navigationController pushViewController:lcview animated:YES];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;
    int count = (int)scrW / 73;
    CGFloat cellX = (indexPath.row % count) * 73.0;
    CGFloat cellY = (indexPath.row / count) * 70.0;
    cell.frame = CGRectMake(cellX, cellY, 60, 60);
//    cell.backgroundColor = [UIColor blackColor];
    cell.delegate = self;
    if (indexPath.row == self.dataArray.count) {
        [cell.cityBtn setBackgroundImage:[UIImage imageNamed:@"add_person.imageset"] forState:UIControlStateNormal];
//        [cell.cityBtn setBackgroundColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0]];
    }else {
    
        [cell.cityBtn setBackgroundColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0]];
        
    }
    
    return cell;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataArray.count){
    
        NSLog(@"最后一个");
    }else {
    
        NSLog(@"随即");
    
    }




}


- (void)addCityClick:(UIButton *)btn {
    UIButton *b = btn.subviews[0];
    b.hidden = !b.hidden;
   
}



//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    if (indexPath.row == self.dataArray.count) {
//        
//
//    }else {
//        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//        cell.deleteBtn.hidden = NO;
//        
//    
//    }
//
//}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return CGSizeMake(60, 60);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.dataArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
