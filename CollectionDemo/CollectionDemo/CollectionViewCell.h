//
//  CollectionViewCell.h
//  CollectionDemo
//
//  Created by 罗成 on 15/11/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CollectionViewCellDelegate <NSObject>

@optional

- (void)addCityClick:(UIButton *)btn;

@end
@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *cityBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
@property (nonatomic, weak) id <CollectionViewCellDelegate> delegate;


@end
