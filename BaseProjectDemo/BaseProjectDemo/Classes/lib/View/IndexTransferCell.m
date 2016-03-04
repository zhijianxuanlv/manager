//
//  IndexTransferCell.m
//  Bel
//
//  Created by Leon on 16/1/28.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "IndexTransferCell.h"

@interface IndexTransferCell ()

@property (nonatomic, weak) IBOutlet UIButton *titleBtn;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UILabel *periodsLabel;
@property (nonatomic, weak) IBOutlet UILabel *discountLabel;
@property (nonatomic, weak) IBOutlet UILabel *amoutLabel;

@end

@implementation IndexTransferCell


- (void)setBaseModel:(TransferModel *)baseModel {
    _baseModel = baseModel;
    
    _rateLabel.attributedText =
    [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.1f",_baseModel.rate ]
                             fontSize:21
                                 unitString:@"%"];
    _periodsLabel.attributedText =
    [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%ld",_baseModel.period ]
                             fontSize:21
                                 unitString:@"期"];
    
    _rateLabel.attributedText
    = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.1f", _baseModel.rate]
                               fontSize:21
                                   unitString:@"%"];
    _discountLabel.attributedText
    = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.1f", _baseModel.discountRate * 100]
                               fontSize:21
                                   unitString:@"%"];
    
    _amoutLabel.attributedText
    = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.0f", _baseModel.remainingAmount]
                               fontSize:21
                                   unitString:@"份"];
}


@end
