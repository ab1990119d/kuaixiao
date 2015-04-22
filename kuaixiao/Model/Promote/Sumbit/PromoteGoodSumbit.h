//
//  PromoteGoodSumbit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/7.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

@interface PromoteGoodSumbit : BaseModel
/**
 * 预期销量
 */
@property (nonatomic , strong)NSString *num;
/**
 * 物料Id
 */
@property (nonatomic , strong)NSString *goodId;
/**
 * 花费
 */
@property (nonatomic , strong)NSString *price;
@end
