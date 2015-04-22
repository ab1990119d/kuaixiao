//
//  OrderDetail.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"
#import "ProductMeasure.h"

/**
 * 订单明细
 */
@interface OrderDetail : BaseModel
/**
 * 主键Id
 */
@property int detailId;
/**
 * 产品Id
 */
@property int proId;
/**
 * 公司Id
 */
@property int compId;
/**
 * 产品名称
 */
@property (nonatomic , strong)NSString *proName;
/**
 * 产品数量（换算过后的数量，基于下单时产品的主计量单位）
 */
@property double num;
/**
 * 订单Id
 */
@property (nonatomic , strong)NSString *orderId;
/**
 * 主计量单位Id
 */
@property int mesureId;

/**
 * 主计量单位Id 2
 */
@property int measureId;

/**
 * 产品原价格
 */
@property double originPrice;
/**
 *下单时录入价格
 */
@property double  price;
/**
 * 产品总价
 */
@property double totalPrice;
/**
 * 下单数量（基于下单时选的计量单位）
 */
@property double origMeasureNum;

/**
 * 折扣：打折
 */
@property double discountPercent;
/**
 * 折扣：直减价
 */
@property double discountSub;
/**
 *  折扣 1 还是减价 2
 */
@property int dis;
/**
 * 主计量单位名称
 */
@property (nonatomic , strong)NSString *measureName;
/**
 * 下单计量单位名称
 */
@property (nonatomic , strong)NSString *origMeasureName;
/**
 * 库存量
 */
@property double inventory;

/**
 * 辅助计量单位
 */
@property (nonatomic , strong) NSMutableArray *productMeasureList;
/**
 * 产品备注
 */
@property (nonatomic , strong)NSString *proMemo;

// 暂时没用的
/**
 * 发货数量
 */
@property double fahuoNum;//

/**
 * 下单计量单位
 */
@property int origMeasureId;
/**
 * 规格
 */
@property (nonatomic , strong)NSString *specification;
/**
 * 型号
 */
@property (nonatomic , strong)NSString *model;
/**
 * 出库数量
 */
@property double chukunum;
/**
 * 目录名称
 */
@property (nonatomic , strong)NSString *catalogName;
/**
 * 目录Id
 */
@property  int catalogId;
/**
 * 二维码
 */
@property (nonatomic , strong)NSString *barCode;

@end
