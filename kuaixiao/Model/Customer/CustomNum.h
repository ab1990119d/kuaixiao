//
//  CustomNum.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/30.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  接受客户详情中的各种数量

#import "BaseModel.h"

@interface CustomNum : BaseModel

/** 联系人数量*/
@property int contactNum;
/** 商机管理数量*/
@property int chanceNum;
/** 促销管理数量*/
@property int promoteManagenum;
/** 拜访记录数量*/
@property int visitNum;
/** 历史陈列数量*/
@property int exhibitNum;
/** 历史竞品数量*/
@property int completeNum;
/** 历史促销数量*/
@property int promotenum;
/** 历史订单数量*/
@property int orderNum;
/** 历史销量数量*/
@property int saleNum;
/** 历史库存数量*/
@property int storeNum;

@end
