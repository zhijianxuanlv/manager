//
//  BaseInvestModel.m
//  Bel
//
//  Created by Leon on 16/1/18.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "BaseInvestModel.h"

@implementation BaseInvestModel

- (void)setPayment:(NSInteger)payment {
    _payment = payment;
    switch (_payment) {
        case 1:
            _paymentStr = @"月付息到期还本";
            break;
        case 2:
            _paymentStr = @"一次性还本付息";
            break;
        case 3:
            _paymentStr = @"等额本息";
            break;
        case 4:
            _paymentStr = @"分期等额";
            break;
        case 5:
            _paymentStr = @"等额本金";
            break;
        default:
            break;
    }
}

- (void)setPrdNum:(NSString *)prdNum {
    _prdNum = prdNum;
    if (!_prdNumber){
        _prdNumber = _prdNum;
    }
}

@end
