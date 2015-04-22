//
//  PromoteProductSumbit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/7.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

@interface PromoteProductSumbit : BaseModel

/**
 * 促销产品Id
 */
@property (nonatomic , strong)NSString *proId;
/**
 * 预期销量
 */
@property (nonatomic , strong)NSString *expectedSales;
/**
 * 促销价格
 */
@property (nonatomic , strong)NSString *origPrice;
/**
 * 原始价格
 */
@property (nonatomic , strong)NSString *price;
/**
 * 原始计量单位
 */
@property (nonatomic , strong)NSString *measureId;
/**
 * 促销计量单位
 */
@property (nonatomic , strong)NSString *origMeasureId;

@end
