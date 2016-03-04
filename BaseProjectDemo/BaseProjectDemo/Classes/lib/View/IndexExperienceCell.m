//
//  IndexExperienceCell.m
//  Bel
//
//  Created by Leon on 16/1/28.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "IndexExperienceCell.h"

@interface IndexExperienceCell()

@property (nonatomic, weak) IBOutlet UIButton *titleBtn;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UILabel *amountLabel;
@property (nonatomic, weak) IBOutlet UILabel *periodsLabel;

@end


@implementation IndexExperienceCell

- (void)setBaseModel:(Newhand *)baseModel {
    _baseModel = baseModel;
    [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.1f",_baseModel.rate ] fontSize:21 unitString:@"%"];
    _rateLabel.attributedText =
    _amountLabel.attributedText =
        [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%ld",_baseModel.amount ] fontSize:21 unitString:@"元"];
    _periodsLabel.attributedText =
        [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%ld",_baseModel.periods ] fontSize:21 unitString:@"天"];
}

@end
