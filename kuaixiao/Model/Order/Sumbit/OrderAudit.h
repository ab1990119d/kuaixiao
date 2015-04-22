//
//  OrderAudit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/25.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseModel.h"

/*** 订单审批 */
@interface OrderAudit : BaseModel

/* 审批ID */
@property (nonatomic , strong)NSString *auditId;
/* 订单ID */
@property (nonatomic , strong)NSString *orderId;
/* 审批人 */
@property (nonatomic , strong)NSString *userId;
/* 审批Name */
@property (nonatomic , strong)NSString *userName;
/* 审批状态 */
@property (nonatomic , strong)NSString *state;
/* 审批状态 字符串 */
@property (nonatomic , strong)NSString *stateString;
/* 审批文本 */
@property (nonatomic , strong)NSString *auditTxt;
/* 审批日期 */
@property (nonatomic , strong)NSString *auditDate;
/* 提交日期 */
@property (nonatomic , strong)NSString *submitDate;
/* 仓库ID */
@property (nonatomic , strong)NSString *storehouseId;
/* 仓库名称 */
@property (nonatomic , strong)NSString *storehouseName;

@end
