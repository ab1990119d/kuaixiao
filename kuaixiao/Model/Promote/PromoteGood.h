//
//  PromoteGood.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/5.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

@interface PromoteGood : BaseModel

/**
 * 物料ID
 */
@property (nonatomic , strong)NSString *goodId;
/**
 *物料名称
 */
@property (nonatomic , strong)NSString *goodName;
/**
 * 物料类别
 */
@property (nonatomic , strong)NSString *goodTypeDisplay;
/**
 * 数量
 */
@property (nonatomic , strong)NSString *num;
/**
 * 花费
 */
@property double price;
/**
 * 申请人名称
 */
@property (nonatomic , strong)NSString *promoteGoodId;
/**
 * 申请人名称
 */
@property (nonatomic , strong)NSString *promoteId;
/**
 * 物料类型
 */
@property (nonatomic , strong)NSString *type;
/**
 * 物料类型
 */
@property (nonatomic , strong)NSString *goodCode;
/**
 * 物料类型
 */
@property (nonatomic , strong)NSString *compId;


@end
