//
//  PromoteProduct.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/5.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "PromoteProduct.h"
#import "ProductMeasure.h"

@implementation PromoteProduct
- (NSDictionary *)objectClassInArray
{
    return @{@"productMeasureList" : [ProductMeasure class]};
}


@end
