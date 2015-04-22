//
//  Chance.h
//  kuaixiao
//
//  Created by 邹克鹏 on 14/12/15.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface Chance : NSObject
@property (nonatomic,strong )NSString *chanceId;//商机Id
@property (nonatomic ,strong)NSString *custId;//商机所属客户Id
@property (nonatomic ,strong)NSString *custName;//商机所属客户名称
@property (nonatomic )long contactId;//客户联系人Id
@property (nonatomic ,strong)NSString *realName;//客户联系人名称(realName)
@property (nonatomic ,strong)NSString *chanceName;//商机名称
@property (nonatomic ,strong)NSString *dealDate;//预计成效时间
@property (nonatomic ,strong)NSString *dealMoney;//预计成交金额
@property (nonatomic )int stage;//所处阶段
@property (nonatomic ,strong)NSString *stageDisplay;//所处阶段 TXT
@property (nonatomic ,strong)NSString *chanceSource;//商机来源
@property (nonatomic ,strong)NSString *chanceSourceDisplay;//来源txt
@property (nonatomic ,strong)NSString *minIcon;//创建者头像
@property (nonatomic ,strong)NSString *memo;//备注
@property (nonatomic ,strong)NSString *orderCounts;//订单数量
@property (nonatomic ,strong)NSString *recordCounts;//记录数量
@property (nonatomic ,strong)NSString *createtime;//商机创建时间
@property (nonatomic )long userId;//创建者ID
@property (nonatomic ,strong)NSString *userName;//创建者名称
@property (nonatomic )long compId;//用户所属公司Id
@property (nonatomic ,strong)NSArray *chanceUserList;//跟进人列表
@property (nonatomic ,strong)NSString *exUserId;//跟进者Id
@property (nonatomic ,strong)NSString *exUserName;//跟进者名称
@property (nonatomic ,strong)NSString *exUserMinPhoto;//跟进者头像
@property (nonatomic ,strong)NSString *favoriteFlag; // 是否收藏
@end
