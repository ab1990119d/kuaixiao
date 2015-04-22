//
//  Order.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/19.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

/**
 * 订单状态：1、未审核、2审核不通过、3未出库、4需发货、5部分发货、6全部发货
 */
#define orderState_1  1
#define orderState_2  2;
#define orderState_3  3;
#define orderState_4  4;
#define orderState_5  5;
#define orderState_6  6;

/**
 * 退货状态：1、无退货、2有退货
 */
#define tuihuoState_1  1;
#define tuihuoState_2  2;

/**
 * 审批状态：1未审核、2审核通过、3审核未通过
 */
#define auditState_1  1;
#define auditState_2  2;
#define auditState_3  3;

/**
 * 订单
 */
@interface Order : BaseModel

/**
 * 客户Id
 */
@property int custId;
/**
 * 客户名称
 */
@property (nonatomic , strong)NSString *custName;

/**
 * 发货人联系方式
 */
@property (nonatomic , strong)NSString *contactPhone;
/**
 * 要求到货时间
 */
@property (nonatomic , strong)NSString *deliverDate;

/**
 * 收货地址
 */
@property (nonatomic , strong)NSString *deliverAddr;
/**
 * 发货联系人
 */
@property (nonatomic , strong)NSString *contactUser;
/**
 *收货说明
 */
@property (nonatomic , strong)NSString *memo;
/**
 * 商机Id
 */
@property long chanceId;
/**
 * 商机名称
 */
@property (nonatomic , strong)NSString *chanceName;
/**
 * 订单合计金额
 */
@property double sum;
/**
 * 手机端4种：1：未审批；2：已审批；3：需发货；4：已发货，5：需我审批已审批列表状态
 */
@property (nonatomic , strong)NSString *phoneOrderState;

/**
 * 主键Id
 */
@property (nonatomic , strong)NSString *orderId;

/**
 * 下单日期
 */
@property (nonatomic , strong)NSString *orderDate;
/**
 * 订单所属用户Id
 */
@property int userId;
/**
 * 公司Id
 */
@property int compId;
/**
 * 部门Id
 */
@property int departId;
/**
 * 创建人Id
 */
@property int creater;

/**
 * 订单编号
 */
@property (nonatomic , strong)NSString *orderNo;


/**
 * 订单审批人
 */
@property int auditUser;
/**
 * 订单审核人姓名
 */
@property (nonatomic , strong)NSString *auditUserName;
/**
 * 审批日期
 */
@property (nonatomic , strong)NSString *auditDate;
/**
 * 审批意见
 */
@property (nonatomic , strong)NSString *auditTxt;
/**
 * 仓库Id
 */
@property long storehouseId;
/**
 * 仓库名称
 */
@property (nonatomic , strong)NSString *storehouseName;


/**
 * 退货状态
 */
@property short tuihuoState;
/**
 * 订单状态
 */
@property short orderState;
/**
 * 审批状态
 */
@property short auditState;
/**
 * 状态显示
 */
@property (nonatomic , strong) NSString *stateDisplay;

/**
 * 状态显示
 */
@property (nonatomic , strong) NSString *auditStateDisplay;


/**
 * 下单人姓名
 */
@property (nonatomic , strong)NSString *orderUserName;
/**
 * 客户地址
 */
@property (nonatomic , strong)NSString *custAddr;

/**
 * 订单日期：月份表示
 */
@property (nonatomic , strong)NSString *orderDateMonth;

/**
 * 订单所属用户
 */
@property int orderUserId;
/**
 *发货月份；统计业绩达成时使用
 */
@property (nonatomic , strong)NSString *fahuoMonth;

/**
 * 是否有查看的权限，统计业绩达成时使用（不能查看不是下级的订单信息）
 */
@property BOOL isSkim;
/**
 * 订单开始日期
 */
@property (nonatomic , strong)NSData *orderDateBegin;
/**
 * 订单结束日期
 */
@property (nonatomic , strong)NSData *orderDateEnd;
/**
 * 发货开始日期
 */
@property (nonatomic , strong)NSData *deliverDateBegin;
/**
 * 发货结束日期
 */
@property (nonatomic , strong)NSData *deliverDateEnd;
/**
 * 订单明细列表
 */
@property (nonatomic , strong) NSMutableArray *orderDetailList;

/**
 * 出库单列表
 */
@property (nonatomic , strong) NSMutableArray *chukuList;
/**
 * 发货单列表
 */
@property (nonatomic , strong) NSMutableArray *fahuolist;
/**
 * 退货单列表
 */
@property (nonatomic , strong) NSMutableArray *tuihuoList;
@end
