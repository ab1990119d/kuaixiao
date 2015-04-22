//
//  Product.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/23.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseEntity.h"
#import "ProductMeasure.h"


/**
 * 产品实体类
 *
 */
@interface Product : BaseEntity

/**
 * 产品Id
 */
@property  int proId;
/**
 * 产品名称
 */
@property  (nonatomic , strong)NSString *proName;
/**
 * 目录Id
 */
@property  int catalogId;
/**
 * 主计量单位Id
 */
@property  int mesureId;
/**
 * 二维码
 */
@property (nonatomic , strong)NSString *barCode;
/**
 * 产品备注
 */
@property (nonatomic , strong)NSString *proMemo;
/**
 * 规格
 */
@property (nonatomic , strong)NSString *specification;
/**
 * 型号
 */
@property (nonatomic , strong)NSString *model;
/**
 * 价格
 */
@property  double price;

/**
 * 目录名称
 */
@property (nonatomic , strong)NSString *catalogName;
/**
 * 公司Id
 */
@property int compId;

/**
 * 计量单位名称
 */
@property(nonatomic , strong)NSString *measureName;

/**
 * 辅助计量单位名称
 */
@property(nonatomic , strong)NSMutableArray *productMeasureList;

/**
 * 库存数量
 */
@property  double inventory;
@end
