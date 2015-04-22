//
//  KSVisitrecord.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/8.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "KSVisitsummary.h"

@interface KSVisitrecord : NSObject
/**
 * 拜访记录Id
 */
@property (nonatomic , strong)NSString *visitrecordId;
/**
 * 客户Id
 */
@property (nonatomic , strong)NSString *custId;
/**
 * 签到时间
 */
@property (nonatomic , strong)NSString *signto;
/**
 * 签到位置
 */
@property (nonatomic , strong)NSString *tolocation;
/**
 * 签到经度
 */
@property (nonatomic , strong)NSString *tolongitude;
/**
 * 签到维度
 */
@property (nonatomic , strong)NSString *tolatitude;
/**
 * 签退时间
 */
@property (nonatomic , strong)NSString *signout;
/**
 * 签退位置
 */
@property (nonatomic , strong)NSString *outlocation;
/**
 * 签退经度
 */
@property (nonatomic , strong)NSString *outlongitude;
/**
 * 签退维度
 */
@property (nonatomic , strong)NSString *outlatitude;
/**
 * 拜访计划Id
 */
@property (nonatomic , strong)NSString *visitplanId;
/**
 * 用户Id
 */
@property (nonatomic , strong)NSString *userId;
/**
 * 用户名称;
 */
@property (nonatomic , strong)NSString *userName;
/**
 * 拜访状态
 */
@property (nonatomic , strong)NSString *state;
/**
 * 客户名称;
 */
@property (nonatomic , strong)NSString *custName;
/**
 * 客户地址;
 */
@property (nonatomic , strong)NSString *custAddr;
/**
 * 签退签到时间差（停留时间）
 */
@property (nonatomic , strong)NSString *stayminute;
/**
 * 拜访总结实体
 */
@property (nonatomic , strong)KSVisitsummary *visitsummary;
/**
 * 统计陈列检查数量
 */
@property (nonatomic , strong)NSString *exhibitNum;
/**
 * 统计竞品上报数量
 */
@property (nonatomic , strong)NSString *competeNum;
/**
 * 统计促销数量
 */
@property (nonatomic , strong)NSString *promoteNum;
/**
 * 统计订单数量
 */
@property (nonatomic , strong)NSString *orderNum;
/**
 * 统计销量数量
 */
@property (nonatomic , strong)NSString *saleNum;
/**
 * 统计库存盘点数量
 */
@property (nonatomic , strong)NSString *storeNum;

+ (KSVisitrecord *) sharedInstance;

@end
