//
//  OrderSubmit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/24.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseEntity.h"
#import "Order.h"
#import "OrderProductSubmit.h"
#import "OrderDetail.h"

@interface OrderSubmit : BaseModel


/*** 订单Id */
@property (nonatomic , strong)NSString *orderId;
/*** 客户Id */
@property (nonatomic , strong)NSString *custId;
/*** 联系方式 */
@property (nonatomic , strong)NSString *contactPhone;
/*** 收货说明 */
@property (nonatomic , strong)NSString *memo;
/*** 订单所属用户Id */
@property (nonatomic , strong)NSString *userId;
/*** 到货时间 */
@property (nonatomic , strong)NSString *deliverDate;
/*** 审批人Id */
@property (nonatomic , strong)NSString *auditUserId;
/*** 收货地址*/
@property (nonatomic , strong)NSString *deliverAddr;
/*** 收货人 */
@property (nonatomic , strong)NSString *contactUser;
/*** 产品 */
@property (nonatomic , strong)NSMutableArray *productJsons;


+(id)initWithOrder:(Order *) order;

@end
