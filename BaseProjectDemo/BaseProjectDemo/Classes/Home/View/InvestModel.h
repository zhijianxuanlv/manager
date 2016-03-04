//
//  InvestModel.h
//  Bel
//
//  Created by Leon on 16/1/18.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseInvestModel.h"

@interface InvestModel : BaseInvestModel

@property (nonatomic, assign) double contractMoney;     /**< contractMoney:项目金额 */
@property (nonatomic, assign) NSInteger remainingAmount;   /**< remainingAmount:可投金额 */
@property (nonatomic, strong) NSString *crmOrderId;     /**< crmOrderId:信贷订单编号 */
@property (nonatomic, strong) NSString *cid;            

@property (nonatomic, assign) NSInteger periods;        /**< periods:期数*/

@property (nonatomic, assign) TradeStatus tradeStatus;    /**< tradeStatus:交易状态 */

@property (nonatomic, assign) double hasInvestAmt ;     /**< hasInvestAmt:已投金额 */

@property (nonatomic, assign) double activitiesRate;    /**< activitiesRate:活动利率 */
@property (nonatomic, strong) NSString *nextPayTime;    /**< 下一个还款日 */
@property (nonatomic, assign) NSInteger fullScaleCount; /**< 满标人数 */

@property (nonatomic, strong) NSString *custId;         /**< 借款人 id */

@property (nonatomic, assign) NSInteger ef_fective_amt; /**< 我的投资金额 */
@property (nonatomic, assign) NSInteger coupon_amount;  /**< 代金券金额 */
@property (nonatomic, assign) NSInteger ef_type;        /**< 订单类型, 5为新手项目 */

@end
