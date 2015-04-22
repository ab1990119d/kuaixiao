//
//  OrderSubmit.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/24.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "OrderSubmit.h"
#import "OrderProductSubmit.h"

@implementation OrderSubmit
- (NSDictionary *)objectClassInArray
{
    return @{@"productJsons" : [OrderProductSubmit class]};
}

+(id)initWithOrder:(Order *) order{
    OrderSubmit *orderSumbit = [[OrderSubmit alloc]init];
    orderSumbit.orderId = order.orderId;
    orderSumbit.custId = [AppUtiles stringFromDouble:order.custId];
    orderSumbit.contactPhone = order.contactPhone;
    orderSumbit.memo = order.memo;
    orderSumbit.userId =[AppUtiles stringFromDouble:order.userId];
    orderSumbit.deliverDate = order.deliverDate;
    orderSumbit.auditUserId = [AppUtiles stringFromDouble:order.auditUser];
    orderSumbit.deliverAddr = order.deliverAddr;
    orderSumbit.contactUser = order.contactUser;
    orderSumbit.productJsons = [NSMutableArray new];
    
    for (OrderDetail *detail in order.orderDetailList) {
        OrderProductSubmit *productSumbit = [[OrderProductSubmit alloc]init];
        productSumbit.proId = [AppUtiles stringFromDouble:detail.proId];
        productSumbit.compId = [AppUtiles stringFromDouble:detail.compId];
        productSumbit.model = detail.model;
        productSumbit.proMemo = detail.proMemo;
        productSumbit.catalogName =detail.catalogName;
        productSumbit.proName = detail.proName;
        productSumbit.specification = detail.specification;
        productSumbit.catalogId = [AppUtiles stringFromDouble:detail.catalogId];
        productSumbit.barCode = detail.barCode;
        productSumbit.price = [AppUtiles stringFromDouble2:detail.originPrice];
        if ([AppUtiles stringFromDouble:detail.mesureId] == nil) {
              productSumbit.measureId = [AppUtiles stringFromDouble:detail.measureId];
        }else{
          productSumbit.measureId = [AppUtiles stringFromDouble:detail.mesureId];
        }
        productSumbit.measureName = detail.measureName;
        productSumbit.discountPercent = [AppUtiles stringFromDouble:detail.discountPercent];
        productSumbit.discountSub = [AppUtiles stringFromDouble:detail.discountSub];
        productSumbit.inputPrice = [AppUtiles stringFromDouble2:detail.price];
        productSumbit.origMeasureId = [AppUtiles stringFromDouble:detail.origMeasureId];
        productSumbit.origMeasureName = detail.origMeasureName;
        productSumbit.origMeasureNum =[AppUtiles stringFromDouble:detail.origMeasureNum];
        
        [orderSumbit.productJsons addObject:productSumbit];
    }
    
    
    return orderSumbit;
}

@end
