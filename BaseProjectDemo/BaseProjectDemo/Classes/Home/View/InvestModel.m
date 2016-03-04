//
//  InvestModel.m
//  Bel
//
//  Created by Leon on 16/1/18.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "InvestModel.h"

@implementation InvestModel

- (void)setCid:(NSString *)cid {
    if (cid) {
        _cid = cid;
        _crmOrderId = _cid;
    }
}

@end
