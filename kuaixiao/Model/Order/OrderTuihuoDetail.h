//
//  OrderTuihuoDetail.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

/**
 * 退货单明细
 *
 */
@interface OrderTuihuoDetail : BaseModel
/**
 * 产品Id
 */
@property (nonatomic , strong)NSString *proId;
/**
 * 退货Id
 */
@property (nonatomic , strong)NSString *tuihuoId;
/**
 * 订单Id
 */
@property (nonatomic , strong)NSString *orderId;
/**
 * 订单编号
 */
@property (nonatomic , strong)NSString *orderNo;
/**
 * 主计量单位Id
 */
@property (nonatomic , strong)NSString *measureId;
/**
 * 退货数量
 */
@property (nonatomic , strong)NSString *tuihuoNum;
/**
 * 订单数量
 */
@property (nonatomic , strong)NSString *orderNum;
/**
 * 订单金额
 */
@property double orderPrice;
/**
 * 主计量单位名称
 */
@property (nonatomic , strong)NSString *measureName;
/**
 * 产品名称
 */
@property (nonatomic , strong)NSString *proName;
/**
 * 规格
 */
@property (nonatomic , strong)NSString *specification;
/**
 * 型号
 */
@property (nonatomic , strong)NSString *model;
/**
 * 入库数量
 */
@property (nonatomic , strong)NSString *rukuNum;

@end
