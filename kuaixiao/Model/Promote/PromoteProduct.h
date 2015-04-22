//
//  PromoteProduct.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/5.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//  促销中的产品

#import "BaseModel.h"

@interface PromoteProduct : BaseModel

/**
 *  反馈的实际销售额
 */
@property (nonatomic , strong)NSString *actualAmount;
/**
 * 反馈的实际销量
 */
@property  double  actualSales;
/**
 * 预计销量
 */
@property  double expectedSales;
/**
 * 反馈的销售情况
 */
@property (nonatomic , strong)NSString *feedback;
/**
 * 主计量单位Id
 */
@property int measureId;
/**
 * 主计量单位Id2
 */
@property int mesureId;
/**
 * 主计量单位名称
 */
@property (nonatomic , strong)NSString *measureName;
/**
 * 型号
 */
@property (nonatomic , strong)NSString *model;
/**
 * 原计量单位Id
 */
@property int  origMeasureId;
/**
 * 原计量单位名称
 */
@property (nonatomic , strong)NSString *origMeasureName;
/**
 * 促销前原价
 */
@property double origPrice;

/**
 * 总金额
 */
@property double totalPrice;
/**
 * 促销价格
 */
@property double price;
/**
 * 产品id
 */
@property int proId;
/**
 * 产品名称
 */
@property (nonatomic , strong)NSString *proName;
/**
 * 促销申请id
 */
@property (nonatomic , strong)NSString *promoteId;
/**
 * 规格
 */
@property (nonatomic , strong)NSString *specification;
/**
 * 辅助计量单位列表
 */
@property(nonatomic , strong)NSMutableArray *productMeasureList;

@end
