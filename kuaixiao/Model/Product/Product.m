//
//  Product.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/23.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "Product.h"

@implementation Product

- (NSDictionary *)objectClassInArray
{
    return @{@"productMeasureList" : [ProductMeasure class]};
}


@end
