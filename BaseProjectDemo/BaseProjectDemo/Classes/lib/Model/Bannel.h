//
//  Bannel.h
//  Bel
//
//  Created by Leon on 16/1/28.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bannel : NSObject

@property (nonatomic, strong) NSString *imgurl;
@property (nonatomic, assign) NSInteger seq;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *webDesc;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *name;

@end
