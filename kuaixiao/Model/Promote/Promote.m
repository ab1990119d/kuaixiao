//
//  Promote.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/5.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "Promote.h"
#import "PromoteProduct.h"
#import "PromoteGood.h"

@implementation Promote
- (NSDictionary *)objectClassInArray
{
    return @{@"promoteProductList" : [PromoteProduct class],@"promoteGoodList" : [PromoteGood class]};
}
@end
