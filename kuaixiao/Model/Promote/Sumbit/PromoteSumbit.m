//
//  PromoteSumbit.m
//  kuaixiao
//
//  Created by 刘旭辉 on 15/1/7.
//  Copyright (c) 2015年 邹克鹏. All rights reserved.
//

#import "PromoteSumbit.h"

@implementation PromoteSumbit
- (NSDictionary *)objectClassInArray
{
    return @{@"productJsons" : [PromoteProductSumbit class],@"goodJsons" : [PromoteGoodSumbit class]};
}


+(id)initWithPromote:(Promote *) promote{
    PromoteSumbit *sumbit = [[PromoteSumbit alloc]init];
    sumbit.startTime = promote.startTime;
    sumbit.endTime = promote.endTime;
    sumbit.custId = [[NSString alloc]initWithFormat:@"%d",promote.custId ];
    sumbit.desc = promote.desc;
    sumbit.leader = [[NSString alloc]initWithFormat:@"%d",promote.leader ];
    sumbit.sum = [[NSString alloc]initWithFormat:@"%0.f",promote.sum ];
    sumbit.auditUser = [[NSString alloc]initWithFormat:@"%d",promote.auditorId ];
    sumbit.productJsons = [NSMutableArray new];
    sumbit.goodJsons = [NSMutableArray new];
    
    for (PromoteProduct *product in promote.promoteProductList) {
        PromoteProductSumbit *productSumbit = [[PromoteProductSumbit alloc]init];
        productSumbit.proId = [AppUtiles stringFromDouble:product.proId];
        productSumbit.expectedSales = [AppUtiles stringFromDouble:product.expectedSales];
        productSumbit.origPrice = [AppUtiles stringFromDouble:product.origPrice];
        productSumbit.price = [AppUtiles stringFromDouble:product.price];
        if ([AppUtiles stringFromDouble:product.mesureId] == nil) {
            productSumbit.measureId = [AppUtiles stringFromDouble:product.measureId];
        }else{
            productSumbit.measureId = [AppUtiles stringFromDouble:product.mesureId];
        }
        productSumbit.origMeasureId = [[NSString alloc]initWithFormat:@"%d",product.origMeasureId ];
        [sumbit.productJsons addObject:productSumbit];
    }
    
    for (PromoteGood *good in promote.promoteGoodList) {
        
        PromoteGoodSumbit *goodSumbit = [[PromoteGoodSumbit alloc]init];
        
        goodSumbit.num = good.num;
        goodSumbit.goodId = good.goodId;
        goodSumbit.price = [AppUtiles stringFromDouble2:good.price];
        
        [sumbit.goodJsons addObject:goodSumbit];
    }
    return sumbit;
}
@end
