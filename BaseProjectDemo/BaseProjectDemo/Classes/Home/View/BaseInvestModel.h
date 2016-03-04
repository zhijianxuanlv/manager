//
//  BaseInvestModel.h
//  Bel
//
//  Created by Leon on 16/1/18.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseInvestModel : NSObject

@property (nonatomic, strong) NSString *id;             /**< 产品 id */
@property (nonatomic, strong) NSString *prdId;          /**< 产品类型id */
@property (nonatomic, strong) NSString *prdName;        /**prdName:产品名 */
@property (nonatomic, strong) NSString *prdNumber;      /**< prdNumber:订单编号 */
#warning 这又是一个重复的属性
@property (nonatomic, strong) NSString *prdNum;         /**< 同上 */

@property (nonatomic, assign) double rate;              /**< rate:利率 */
@property (nonatomic, assign) double progress;          /**< progress:百分比 */
@property (nonatomic, assign) NSInteger payment;        /**< payment:还款方式 */
@property (nonatomic, strong, readonly) NSString *paymentStr;     /**< <#comments#> */

@property (nonatomic, strong) NSString *custInfoId;
@property (nonatomic, strong) NSString *efOrderId;
@property (nonatomic, assign) double fee;          /**< 转让费*/

@property (nonatomic, strong) NSString *createTime;

@end
