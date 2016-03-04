//
//  TransferModel.h
//  Bel
//
//  Created by Leon on 16/1/18.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "BaseInvestModel.h"

@interface TransferModel : BaseInvestModel

@property (nonatomic, assign) double actualAmt;         /**< 实际售价 */
@property (nonatomic, assign) double discountRate;
@property (nonatomic, assign) NSInteger period;         /**<  剩余期限 */
@property (nonatomic, assign) NSInteger tperiod;         /**<  期限 */

@property (nonatomic, assign) double remainingAmount;   /**< 可投金额 */
@property (nonatomic, assign) NSInteger remainCount;
@property (nonatomic, strong) NSString *saleId;         /**< 产品ID */
@property (nonatomic, assign) NSInteger status;         /**< 产品状态：0、可投；2、交易完成 */
@property (nonatomic, assign) double transferAmt;       /**<  债权金额 */
@property (nonatomic, assign) TranfserStatus transferStatus;
@property (nonatomic, assign) double remainAmt;

@end
