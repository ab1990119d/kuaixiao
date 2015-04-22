//
//  OrderChuku.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/4.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

/**
 * 出库状态：1、未出库、2已出库
 */
#define chukuState_1 1;
#define chukuState_2 2;

#import "BaseModel.h"

@interface OrderChuku : BaseModel


//{
//    chukuState = 2;
//    chukuStateDisplay = "\U5df2\U51fa\U5e93";
//    compId = 1;
//    createDate = "2014-12-26 16:59:38";
//    createDateEnd = "";
//    createDateStart = "";
//    custId = 11294;
//    execDate = "2015-01-04 00:00:00";
//    execDateEnd = "";
//    execDateStart = "";
//    execUser = 111962;
//    execUserName = "";
//    memo = dfsdfds;
//    orderId = 2034;
//    orderNo = DD1412260004;
//    rukuCreater = 111962;
//    rukuCreaterName = "\U95ee\U95ee";
//    rukuId = 672;
//    rukuNo = CKD1412260002;
//    rukuProList =     (
//    );
//    storehouseId = 7;
//    storehouseName = "\U4e0a\U6d77\U4ed3\U5e93";
//    title = "\U9500\U552e\U8ba2\U5355DD1412260004";
//    tuihuoId = 0;
//    tuihuoNo = "";
//    type = 2;
//}

/**出库Id */
@property (nonatomic , strong)NSString *rukuId;
/**订单号 */
@property (nonatomic , strong)NSString *orderNo;
/**出库单号 */
@property (nonatomic , strong)NSString *rukuNo;
/**出库时间 */
@property (nonatomic , strong)NSString *execDate;
/**显示状态 */
@property (nonatomic , strong)NSString *chukuStateDisplay;
/**显示状态编码 */
@property (nonatomic , strong)NSString *chukuState;
/**创建人 */
@property (nonatomic , strong)NSString *rukuCreaterName;
/**创建时间 */
@property (nonatomic , strong)NSString *createDate;
/**仓库 */
@property (nonatomic , strong)NSString *storehouseName;
/**出库说明 */
@property (nonatomic , strong)NSString *memo;
/**出库产品 */
@property (nonatomic , strong)NSArray *rukuProList;

@end
