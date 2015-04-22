//
//  KSVisitsummary.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/8.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface KSVisitsummary : NSObject

/**
 * 主键Id
 */
@property (nonatomic , strong)NSString *summaryId;
/**
 * 拜访总结内容
 */
@property (nonatomic , strong)NSString *summaryContent;
/**
 * 拜访计划Id
 */
@property (nonatomic , strong)NSString *visitplanId;
/**
 * 客户Id
 */
@property (nonatomic , strong)NSString *custId;
/**
 * 总结人Id
 */
@property (nonatomic , strong)NSString *createUser;
/**
 * 创建时间
 */
@property (nonatomic , strong)NSString *createTime;
/**
 * 拜访记录Id
 */
@property (nonatomic , strong)NSString *visitrecordId;

/**
 * 录音文件路径
 */
@property (nonatomic , strong)NSString *voicePath;
/**
 *录音文件大小(单位：B)
 */
@property (nonatomic , strong)NSString *voiceSize;
/**
 * 录音文件时长(单位：秒)
 */
@property (nonatomic , strong)NSString *voiceDuration;

/**
 * 拜访总结图片List
 */
@property (nonatomic , strong)NSMutableArray *voucherList;



@end
