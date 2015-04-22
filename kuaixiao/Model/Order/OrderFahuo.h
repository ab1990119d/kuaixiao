//
//  OrderFahuo.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

/**
 * 发货状态：1需发货、2已发货
 */
#define fahuoState_1 1;
#define fahuoState_2 2;

#import "BaseModel.h"

@interface OrderFahuo : BaseModel
//{
//    compId = 1;
//    createrId = 111962;
//    createrName = "\U95ee\U95ee";
//    createrTime = "2015-01-04 09:06:20";
//    custId = 11294;
//    custName = "\U62d6\U62d6\U62c9\U62c9";
//    execUser = 111962;
//    execUserName = "\U95ee\U95ee";
//    fahuoDetailList =     (
//    );
//    fahuoId = 432;
//    fahuoNo = FH1501040002;
//    fahuoStateDisplay = "\U5df2\U53d1\U8d27";
//    fahuoSum = 0;
//    fahuoTime = "2015-01-04 00:00:00";
//    memo = 3213sfsdfs;
//    orderId = 2034;
//    orderNo = DD1412260004;
//    state = 2;
//}
/** * 发货Id */
@property (nonatomic ,strong) NSString *fahuoId;

/** * 发货编号 */
@property (nonatomic ,strong) NSString *fahuoNo;
/** * 发货状态 */
@property (nonatomic ,strong) NSString *fahuoStateDisplay;

/**
 * 创建人Id
 */
@property (nonatomic ,strong) NSString *createrId;

/**
 * 执行人Id
 */
@property (nonatomic ,strong) NSString *execUser;

/**
 * 创建时间
 */
@property (nonatomic ,strong) NSString *createrTime;

/**
 * 发货时间
 */
@property (nonatomic ,strong) NSString *fahuoTime;

/**
 * 备注
 */
@property (nonatomic ,strong) NSString *memo;
/**
 * 状态
 */
@property (nonatomic ,strong) NSString *state;
/**
 * 公司Id
 */
@property (nonatomic ,strong) NSString *compId;
/**
 * 订单Id
 */
@property (nonatomic ,strong) NSString *orderId;
/**
 * 订单编号
 */
@property (nonatomic ,strong) NSString *orderNo;
/**
 * 客户Id
 */
@property (nonatomic ,strong) NSString *custId;

/**
 * 创建人名称
 */
@property (nonatomic ,strong) NSString *createrName;
/**
 * 执行人名称
 */
@property (nonatomic ,strong) NSString *execUserName;
/**
 * 客户名称
 */
@property (nonatomic ,strong) NSString *custName;

/**
 * 发货总金额
 */
@property (nonatomic ,strong) NSString *fahuoSum;//发货总金额

/**
 * 发货明细列表
 */
@property (nonatomic , strong)NSArray *fahuoDetailList;

@end
