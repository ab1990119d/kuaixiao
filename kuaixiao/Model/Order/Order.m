//
//  Order.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/19.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "Order.h"
#import "OrderDetail.h"
#import "OrderChuku.h"
#import "OrderFahuo.h"
#import "OrderTuihuo.h"

@implementation Order
- (NSDictionary *)objectClassInArray
{
    return @{@"orderDetailList" : [OrderDetail class],@"chukuList" : [OrderChuku class],@"fahuolist" : [OrderFahuo class],@"tuihuoList" : [OrderTuihuo class]};
}

@end
