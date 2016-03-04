//
//  InvestStatusInCell.m
//  Bel
//
//  Created by Leon on 16/1/18.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "InvestStatusInCell.h"
#import "InvestModel.h"
#import "ZFProgressView.h"

@interface InvestStatusInCell()

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UILabel *periodsLabel;
@property (nonatomic, weak) IBOutlet UILabel *amtLabel;
@property (nonatomic, weak) IBOutlet UIProgressView *progressView;
@property (nonatomic, weak) IBOutlet UILabel *progressLabel;
@end

@implementation InvestStatusInCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


- (void)setInvest:(InvestModel *)invest {
    _invest = invest;
    _nameLabel.text = [NSString stringWithFormat:@"%@%@",_invest.prdName,_invest.prdNumber];
    
    _rateLabel.attributedText = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.1f", _invest.rate]
                                                         unitString:@"%"];
    
    
    _periodsLabel.attributedText = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%ld", _invest.periods]
                                                                unitString:@"个月"];
    
    
    _amtLabel.attributedText = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%ld", _invest.remainingAmount]
                                                            unitString:@"元"];

    
    self.progressView.progress = _invest.progress/ 100.0;
    
    if (_invest.progress == 100) {
        _progressLabel.text = @"100%";
    } else {
        _progressLabel.text = [NSString stringWithFormat:@"%.0f%%", _invest.progress];
    }
}

@end
