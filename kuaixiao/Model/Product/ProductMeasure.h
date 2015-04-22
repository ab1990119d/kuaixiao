//
//  ProductMeasure.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/23.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseEntity.h"

/**
 *产品计量单位
 */
@interface ProductMeasure : BaseEntity
/**
 *产品Id
 */
@property long proId;

/**
 * 主计量单位Id
 */
@property int measureId;

/**
 * 相对于主计量单位的换算关系
 */
@property long baseMeasureConvert;

/**
 * 主计量单位名称
 */
@property(nonatomic , strong)NSString *measureName;
@end
