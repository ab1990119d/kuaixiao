//
//  NetWorkUtil.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/4.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLSessionManager.h"

@interface NetWorkUtil : NSObject


+(AFHTTPRequestOperationManager *)getManager;

+ (void)uploadFile:(NSString*) fileName;


+ (void)downFile:(NSString*) filePath;

//同步下载
+(NSData *)down:(NSString *)filePath;

@end

//
//NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//NSDictionary *userDic = [defaults objectForKey:@"userDic"];
//NSString *userId = [userDic objectForKey:@"userId"];
//NSDictionary *parameters = @{@"userId":userId};
//NSString * urlStr = [NSString stringWithFormat:@"%@/contact/list.do",MAINURL];
//
//AFHTTPRequestOperationManager *manager = [NetWorkUtil getManager];
//
//[manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    self.listArr = responseObject;
//  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    [KuaiXiaoTool showAlert:@"登陆失败"];
//}];
