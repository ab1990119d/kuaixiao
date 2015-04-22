//
//  OrderChuku.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/4.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "OrderChuku.h"
#import "OrderChuKuDetail.h"

@implementation OrderChuku
- (NSDictionary *)objectClassInArray
{
    return @{@"rukuProList" : [OrderChuKuDetail class]};
}
@end
