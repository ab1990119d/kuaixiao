//
//  KSVisitsummary.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/8.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "KSVisitsummary.h"
#import "KSVisitSummaryVoucher.h"

@implementation KSVisitsummary

- (NSDictionary *)objectClassInArray
{
    return @{@"voucherList" : [KSVisitSummaryVoucher class]};
}

@end
