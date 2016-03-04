//
//  Newhand.h
//  Bel
//
//  Created by Leon on 16/1/28.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Newhand : NSObject

@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, assign) NSInteger payment;
@property (nonatomic, assign) NSInteger periods;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double rate;

@end
