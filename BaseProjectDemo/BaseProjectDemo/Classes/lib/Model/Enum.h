//
//  Enum.h
//  Bel
//
//  Created by Leon on 16/2/1.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#ifndef Enum_h
#define Enum_h

/**< 0转让中 1已售完 2已买入  */

typedef NS_ENUM(NSInteger, TranfserStatus) {
    TRANSFER_STATUS_IN             = 0, /**< 转让状态,转让中 */
    TRANSFER_STATUS_SOLDOUT        = 1, /**< 转让状态,已售出 */
    TRANSFER_STATUS_BUYED          = 2  /**< 转让状态,已买入 */
};

typedef NS_ENUM(NSInteger, TradeStatus) {
    TRADE_STATUS_IN                = 0, /**< 订单状态: 进行中 */
    TRADE_STATUS_REPAYMENT         = 1, /**< 订单状态: 进入还款 */
    TRADE_STATUS_REFUND            = 2, /**< 订单状态：流标 */
    TRADE_STATUS_FULL_SCALE        = 3, /**< 订单状态：满标 */
    TRADE_STATUS_REPAYMENT_END     = 4, /**< 订单状态：订单还款结束 */
    TRADE_STATUS_EXCEPTIONAL       = 5, /**< 订单状态：异常 */
    TRADE_STATUS_DEATH             = 6, /**< 订单状态：死亡 */
    TRADE_STATUS_LENDING           = 7  /**< 订单状态：满标已放款 */
};

typedef NS_ENUM(NSInteger, VirtualMoneyType) {
    VIRTUAL_MONEY_TYPE_LUCKMONEY   = 1, /**< 红包 */
    VIRTUAL_MONEY_TYPE_VOUCHER     = 2, /**< 代金券 */
    VIRTUAL_MONEY_TYPE_EXPERIENCE  = 3  /**< 体验金 */
};

typedef NS_ENUM(NSInteger, VirtualMoneyStatus) {
    VIRTUAL_MONEY_STATUS_INVALID   = 0, /**< 无效 */
    VIRTUAL_MONEY_STATUS_VALID     = 1, /**< 有效 */
    VIRTUAL_MONEY_STATUS_USED      = 2  /**< 已使用 */
};

typedef NS_ENUM(NSInteger, VerifyCodeMode) {
    VERIFY_CODE_MODE_REGIST        = 1, /**< 注册验证 */
    VERIFY_CODE_MODE_FORGETPWD     = 2, /**< 忘记密码验证 */
    VERIFY_CODE_MODE_CHANGEMOBILE  = 3, /**< 修改手机验证 */
    VERIFY_CODE_MODE_CHANGEBANKPWD = 4  /**< 修改存管密码 */
};

#endif /* Enum_h */
