//
//  KSContact.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/2.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface KSContact :NSObject
@property (nonatomic , strong)NSString *contactId;
@property (nonatomic , strong)NSString *realName; //姓名
@property (nonatomic , strong)NSString *post; //职位
@property (nonatomic , strong)NSString *depart; //部门
@property (nonatomic , strong)NSString *contactAddr; //地址
@property (nonatomic , strong)NSString *tele; //电话
@property (nonatomic , strong)NSString *phone; // 手机
@property (nonatomic , strong)NSString *email; // email
@property (nonatomic , strong)NSString *contactMemo; // 备注
@property (nonatomic , strong)NSString *compName; // 公司名称
@property (nonatomic , strong)NSString *qq; //QQ
@property (nonatomic , strong)NSString *custId; //
@property (nonatomic , strong)NSString *userId;//必传
@property (nonatomic , strong)NSString *pinyin;//拼音索引
//更多
@property (nonatomic , strong)NSString *province ;// 省份
@property (nonatomic , strong)NSString *postCode ;// 邮编
@property (nonatomic , strong)NSString *sex ;// 性别
@property (nonatomic , strong)NSString *birthday ;// 生日
@property (nonatomic , strong)NSString *microBlog ;// 微博
@property (nonatomic , strong)NSString *favoriteFlag; // 是否收藏

+ (KSContact *) sharedInstance;
@end
