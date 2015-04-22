//
//  KSVisitSummaryVoucher.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/8.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface KSVisitSummaryVoucher : NSObject

/**
 * 主键ID
 */
@property (nonatomic , strong)NSString *voucherId;
/**
 * 图片路径
 */
@property (nonatomic , strong)NSString *path;
/**
 * 创建时间
 */
@property (nonatomic , strong)NSString *createTime;
/**
 * 用户ID
 */
@property (nonatomic , strong)NSString *userId;
/**
 * 拜访总结Id
 */
@property (nonatomic , strong)NSString *summaryId;
@end
