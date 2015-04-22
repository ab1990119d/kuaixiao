//
//  OrderTuihuo.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "OrderTuihuo.h"
#import "OrderTuihuoDetail.h"

@implementation OrderTuihuo
- (NSDictionary *)objectClassInArray
{
    return @{@"tuihuoDetailList" : [OrderTuihuoDetail class]};
}
@end
