//
//  OrderFahuo.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/22.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "OrderFahuo.h"
#import "OrderFahuoDetail.h"

@implementation OrderFahuo
- (NSDictionary *)objectClassInArray
{
    return @{@"fahuoDetailList" : [OrderFahuoDetail class]};
}
@end
