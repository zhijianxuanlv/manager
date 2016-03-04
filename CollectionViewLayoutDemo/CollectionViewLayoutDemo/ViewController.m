//
//  ViewController.m
//  CollectionViewLayoutDemo
//
//  Created by 罗成 on 15/12/31.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController.h"
#import "CustomeCollectionViewCell.h"
#import "TemplateFlowLayout.h"
static NSString *const customeCell = @"customeCell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{

    NSMutableArray *imageArray;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ViewController

- (NSMutableArray *)array {

    if (_array == nil) {
        _array = [NSMutableArray array];
    }

    return _array;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0;  i < 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"wuyanzu%d.jpg", i%3];
        UIImage *image = [UIImage imageNamed:imageName];
        [self.array addObject:image];
    }
//    [self.collectionView reloadData];
    TemplateFlowLayout *tempLayout = [[TemplateFlowLayout alloc]init];
    
    [self.collectionView setCollectionViewLayout:tempLayout];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:customeCell forIndexPath:indexPath];
    
    cell.imageView.image= self.array[indexPath.item];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
//    for (CustomeCollectionViewCell *cell in self.collectionView.visibleCells) {
//        NSLog(@"%@",cell.imageView);
//        
//    }
   NSArray *array = self.collectionView.indexPathsForVisibleItems;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
