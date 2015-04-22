//
//  OrderDetail.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "OrderDetail.h"

@implementation OrderDetail
- (NSDictionary *)objectClassInArray
{
    return @{@"productMeasureList" : [ProductMeasure class]};
}

@end
