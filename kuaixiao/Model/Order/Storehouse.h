//
//  Storehouse.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/25.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"
/** 仓库实体类*/
@interface Storehouse : BaseModel

/** 主键Id */
@property (nonatomic , strong)NSString *storehouseId;
/** 仓库名称 */
@property (nonatomic , strong)NSString *storehouseName;
/** 公司Id */
@property (nonatomic , strong)NSString *compId;
/** 创建人*/
@property (nonatomic , strong)NSString *creater;
/** 创建时间*/
@property (nonatomic , strong)NSString *createTime;
/** 地址 */
@property (nonatomic , strong)NSString *address;
/** 联系人*/
@property (nonatomic , strong)NSString *contactPerson;
/** 联系电话*/
@property (nonatomic , strong)NSString * contactPhone;
/** 库管员查询自己的仓库列表*/
@property (nonatomic , strong)NSString *paramAdminUserId;//参数：库管员查询自己的仓库列表
/** 仓库管理员列表*/
@property (nonatomic , strong)NSMutableArray *shuList;

@end
