//
//  CompeteSumbit.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/17.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompeteSumbit : NSObject

/**
 * 主键Id
 */
@property (nonatomic , strong)NSString *competeId;
@property (nonatomic , strong)NSString *formDefId; // 表单定义id
@property (nonatomic , strong)NSMutableArray *content; // 表单字段

@end
