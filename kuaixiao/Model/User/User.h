//
//  User.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/18.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//
/**
 * 用户状态0：禁用，1：启用
 */
#define USER_STATE_0 @"0"
#define USER_STATE_1 @"1"

/**
 * 性别1：男，2：女，3：不详
 */

#define USER_SEX_1 @"1"
#define USER_SEX_2 @"2"
#define USER_SEX_3 @"3"

#import <Foundation/Foundation.h>

@interface User : NSObject

/**
 * 主键Id
 */
@property  NSInteger userId;
/**
 * 姓名
 */
@property (nonatomic , strong)NSString *userName;
/**
 * 电话
 */
@property (nonatomic , strong)NSString *phone;
/**
 * email
 */
@property (nonatomic , strong)NSString *email;
/**
 * 密码
 */
@property (nonatomic , strong)NSString *userPwd;
/**
 * 职位
 */
@property (nonatomic , strong)NSString *post;
/**
 * 性别
 */
@property (nonatomic , strong)NSString *sex;
/**
 * 生日
 */
@property  NSData *birthday;
/**
 * 头像路径 小
 */
@property (nonatomic , strong)NSString *minPhoto;
/**
 * 高清头像路径
 */
@property (nonatomic , strong)NSString *maxPhoto;
/**
 * 排序
 */
@property  NSInteger userOrder;
/**
 * 用户状态
 */
@property (nonatomic , strong)NSString *userState;
/**
 * 所属企业ID
 */
@property  NSInteger compId;
/**
 * 在线状态
 */
@property (nonatomic , strong)NSString *onlineState;
/**
 * 上级领导ID
 */
@property  NSInteger parentId;
/**
 * 是否创建者
 */
@property (nonatomic , strong)NSString *isCreator;
/**
 * 经度
 */
@property  double longitude;
/**
 * 纬度
 */
@property  double latitude;
/**
 * 位置
 */
@property (nonatomic , strong)NSString *location;
/**
 * 拼音
 */
@property (nonatomic , strong)NSString *pinyin;

/**
 * 公司名称
 */
@property (nonatomic , strong)NSString *compName;
/**
 * 公司简称
 */
@property (nonatomic , strong)NSString *shortName;
/**
 * 公司账号
 */
@property (nonatomic , strong)NSString *compCode;
/**
 * 用户角色Id
 */
@property  NSInteger roleId;

/**
 * 用户所属部门Id
 */
@property  NSInteger departId;
/**
 * 部门名称
 */
@property (nonatomic , strong)NSString *departName;

/**
 * 是否管理员
 */
@property (nonatomic , strong)NSString *isAdmin;

/**
 * 直属上级名字
 */
@property (nonatomic , strong)NSString *parentName;


@end
