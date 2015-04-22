//
//  Compete.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/16.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "AutoFormView.h"

@interface Compete : NSObject

/**
 * 主键Id
 */
@property long competeId;

/**
 * 公司Id
 */
@property long compId;

/**
 * 竞品名称
 */
@property (nonatomic , strong)NSString *competeName;

/**
 * 竞品品牌
 */
@property (nonatomic , strong)NSString *brand;

/**
 * 竞品规格
 */
@property (nonatomic , strong)NSString *spec;

/**
 * 竞品计量单位
 */
@property (nonatomic , strong)NSString *unit;

/**
 * 备注
 */
@property (nonatomic , strong)NSString *memo;

/**
 * 二维码
 */
@property (nonatomic , strong)NSString *barCode;

/**
 * 查询条件：排除的竞品id（逗号分割）
 */
@property (nonatomic , strong)NSString *exclCompeteIds;//查询条件：排除的竞品id（逗号分割）
/**
 * 查询条件：1查询已上报的竞品（formInst里有记录）、2、nothing（此条件不起作用)
 */
@property int  submitFilter;
/**
 * 查询条件：过滤已上报竞品的用户 userId、与submitFilter配合使用
 */
@property int  submitUserFilter;


/**
 * 对应的表单视图
 */
@property (nonatomic , strong) AutoFormView *autoView;

@end
