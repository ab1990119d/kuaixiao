//
//  OrderFahuoDetail.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"
/**
 * 发货单明细
 */
@interface OrderFahuoDetail : BaseModel


//chukuId = 672;
//chukuNo = CKD1412260002;
//discountPercent = 0;
//discountSub = 100;
//fahuoId = 432;
//fahuoNum = 967;
//inventory = 0;
//measureId = 4;
//measureName = "\U5c0f\U7bb1";
//model = "";
//orderId = 2034;
//orderNo = DD1412260004;
//orderNum = 967;
//orderPrice = 60;
//proId = 200122;
//proMeasureId = 4;
//proMeasureName = "\U5c0f\U7bb1";
//proName = "\U8499\U725b\U5999\U5999\U65e9\U9910\U65e9\U9910\U4e73\U9178\U996e\U54c1(\U539f\U5473\Uff09180ml";
//productMeasureList =             (
//);
//specification = 180ml;
//sum = 57920;

/**产品名称 */
@property (nonatomic , strong)NSString *proName;
/**订单数量 */
@property (nonatomic , strong)NSString *orderNum;
/**发货数量 */
@property (nonatomic , strong)NSString *fahuoNum;
/**计量单位 */
@property (nonatomic , strong)NSString *measureName;
/**规格 */
@property (nonatomic , strong)NSString *specification;
/**型号*/
@property (nonatomic , strong)NSString *model;
/**价格*/
@property double orderPrice;
/**优惠*/
@property double discountSub;
/**总价格*/
@property double sum;

@end
