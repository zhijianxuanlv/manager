//
//  InvestOtherStatusCell.m
//  Bel
//
//  Created by Leon on 16/1/18.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "InvestOtherStatusCell.h"
#import "InvestModel.h"


@interface InvestOtherStatusCell()

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UILabel *periodsLabel;
@property (nonatomic, weak) IBOutlet UILabel *amtLabel;

@property (nonatomic, weak) IBOutlet UILabel *thirdLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@end

@implementation InvestOtherStatusCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setInvest:(InvestModel *)invest {
    _invest                   = invest;
    _nameLabel.text           = [NSString stringWithFormat:@"%@%@",_invest.prdName,_invest.prdNumber];
    _rateLabel.attributedText = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.1f", _invest.rate]
                                                             unitString:@"%"];
    
    
    _periodsLabel.attributedText = [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%ld", _invest.periods]
                                                                unitString:@"个月"];
    
    switch (_invest.tradeStatus) {
        case TRADE_STATUS_FULL_SCALE:
        case TRADE_STATUS_LENDING:
            _thirdLabel.text = @"满标人次";
            _amtLabel.text  = [NSString stringWithFormat:@"%ld", (long)_invest.fullScaleCount];
//            [LSAttributeString boldStringWith:[NSString stringWithFormat:@"%ld", (long)_invest.fullScaleCount]
//                                         unit:@"人"];
            _iconView.image  = [UIImage imageNamed:@"trade_status_full_scale"];
            break;
        case TRADE_STATUS_REPAYMENT:
            _thirdLabel.text = @"下一个还款日";
            _amtLabel.text   = [_invest.nextPayTime substringToIndex:10];
            _iconView.image  = [UIImage imageNamed:@"trade_status_repayment"];
            break;
        case TRADE_STATUS_REPAYMENT_END:
            _thirdLabel.text = @"结束时间";
            _amtLabel.text   = _invest.nextPayTime;
            _iconView.image  = [UIImage imageNamed:@"trade_status_repayment_done"];
        default:
            _thirdLabel.text = @"";
            _amtLabel.text   = @"";
            _iconView.image  = [[UIImage alloc] init];
            break;
    }
    
    // 设置百分比;
    
}

@end
