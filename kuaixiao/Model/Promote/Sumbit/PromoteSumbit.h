//
//  PromoteSumbit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/7.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"
#import "PromoteGoodSumbit.h"
#import "PromoteProductSumbit.h"
#import "Promote.h"
#import "PromoteGood.h"
#import "PromoteProduct.h"

@interface PromoteSumbit : BaseModel
/**
 * 促销开始时间
 */
@property (nonatomic , strong)NSString *startTime;
/**
 * 促销结束时间
 */
@property (nonatomic , strong)NSString *endTime;
/**
 * 客户Id
 */
@property (nonatomic , strong)NSString *custId;
/**
 * 方式说明
 */
@property (nonatomic , strong)NSString *desc;
/**
 * 负责人
 */
@property (nonatomic , strong)NSString *leader;
/**
 * 申请费用
 */
@property (nonatomic , strong)NSString *sum;
/**
 * 审批人
 */
@property (nonatomic , strong)NSString *auditUser;
/**
 * 促销产品列表
 */
@property (nonatomic , strong)NSMutableArray *productJsons;
/**
 * 促销物料列表
 */
@property (nonatomic , strong)NSMutableArray *goodJsons;


+(id)initWithPromote:(Promote *) promote;
@end
