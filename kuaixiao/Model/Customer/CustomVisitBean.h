//
//  CustomVisitBean.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/12.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface CustomVisitBean : NSObject

@property (nonatomic , strong)NSString *custId;
@property (nonatomic , strong)NSString *userId;
@property (nonatomic , strong)NSString *summaryContent;
@property (nonatomic , strong)NSString *summaryId;
@property (nonatomic , strong)NSString *visitrecordId;
@property (nonatomic , strong)NSString *imageString;
//录音
@property (nonatomic , strong)NSString *voicePath;
@property (nonatomic , strong)NSString *voiceDuration;
@property (nonatomic , strong)NSString *voiceSize;

@end
