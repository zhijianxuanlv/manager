//
//  CustomerCell.h
//  RealmDemo
//
//  Created by 罗成 on 16/1/4.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"
@class CustomerCell;
@protocol CustomerCellDelegate <NSObject>

- (void)cellWithOnclick:(CustomerCell *)cell;

@end
@interface CustomerCell : UITableViewCell

@property (nonatomic, strong) TalkModel *talkModel;

@property (nonatomic, weak) id <CustomerCellDelegate> delegate;
@end
