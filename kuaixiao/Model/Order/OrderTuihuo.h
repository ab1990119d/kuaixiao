//
//  OrderTuihuo.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//
/**
 * 退货状态：1未处理、2执行中、3结束
 */
#define tuihuoState_1 1;
#define tuihuoState_2 2;
#define tuihuoState_3 3;
/**
 * 入库状态：1未入库、2部分入库、3全部入库
 */
#define rukuState_1 1;
#define rukuState_2 2;
#define rukuState_3 3;

#import "BaseModel.h"
/**
 * 退货单
 *
 */
@interface OrderTuihuo : BaseModel


//{
//    compId = 1;
//    createrId = 111962;
//    createrName = "\U95ee\U95ee";
//    createrTime = "2015-01-04 09:28:29";
//    custId = 11294;
//    custName = "\U62d6\U62d6\U62c9\U62c9";
//    execUser = 111962;
//    execUserName = "\U95ee\U95ee";
//    memo = dgdf;
//    orderId = 2034;
//    orderNo = DD1412260004;
//    refund = 13;
//    rukuId = 675;
//    rukuNo = RKD1501040001;
//    rukuState = 1;
//    rukuStateDisplay = "\U672a\U5165\U5e93";
//    state = 2;
//    storehouseId = 0;
//    storehouseName = "\U4e0a\U6d77\U4ed3\U5e93";
//    tuihuoDetailList =     (
//    );
//    tuihuoId = 70;
//    tuihuoNo = TH1501040001;
//    tuihuoStateDisplay = "\U6267\U884c\U4e2d";
//    tuihuoSum = 0;
//    tuihuoTime = "2015-01-04 00:00:00";
//}

/**
 * 退货单id
 */
@property (nonatomic , strong)NSString *tuihuoId;
/**
 * 退货单编号
 */
@property (nonatomic , strong)NSString *tuihuoNo;
/**
 * 创建人
 */
@property (nonatomic , strong)NSString *createrId;
/**
 * 创建时间
 */
@property (nonatomic , strong)NSString *createrTime;
/**
 * 经办人
 */
@property (nonatomic , strong)NSString *execUser;
/**
 * 退货时间
 */
@property (nonatomic , strong)NSString *tuihuoTime;
/**
 * 备注
 */
@property (nonatomic , strong)NSString *memo;
/**
 * 退货状态
 */
@property  int state;
/**
 * 公司id
 */
@property (nonatomic , strong)NSString *compId;
/**
 * 订单id
 */
@property (nonatomic , strong)NSString *orderId;
/**
 * 订单编号
 */
@property (nonatomic , strong)NSString *orderNo;
/**
 * 客户id
 */
@property (nonatomic , strong)NSString *custId;
/**
 * 入库单id
 */
@property (nonatomic , strong)NSString *rukuId;
/**
 * 入库编号
 */
@property (nonatomic , strong)NSString *rukuNo;
/**
 * 仓库id
 */
@property (nonatomic , strong)NSString *storehouseId;
/**
 * 应退款
 */
@property double refund;
/**
 * 入库状态
 */
@property int rukuState;//
/**
 * 创建人名称
 */
@property (nonatomic , strong)NSString *createrName;
/**
 * 经办人名称
 */
@property (nonatomic , strong)NSString *execUserName;
/**
 * 客户名称
 */
@property (nonatomic , strong)NSString *custName;
/**
 * 仓库名称
 */
@property (nonatomic , strong)NSString *storehouseName;

/**
 * 退货合计
 */
@property (nonatomic , strong)NSString *tuihuoSum;

/**
 * 退货状态
 */
@property (nonatomic , strong)NSString *tuihuoStateStr;

/**
 * 出库状态
 */
@property (nonatomic , strong)NSString *rukuStateStr;

/**
 * 退货明细列表
 */
@property (nonatomic , strong)NSArray *tuihuoDetailList;
@end
