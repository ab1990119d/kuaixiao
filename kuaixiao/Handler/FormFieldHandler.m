//
//  FormFieldHandler.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/18.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "FormFieldHandler.h"

@implementation FormFieldHandler

/**
 *  加载表单数据
 *
 *  @param user
 *  @param success
 *  @param failed
 */
- (void)loadForm:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed{

    NSString *path = [BaseHandler requestUrlWithPath:url];
    PrepareExecuteBlock prepareExecute =^(void){
        [AppUtiles showProgressMessage:@"加载中。。。。"];
    };
    
    RTHttpClient *client = [RTHttpClient defaultClient];
    
    [client requestWithPath:path method:RTHttpRequestPost parameters:param prepareExecute:prepareExecute success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        failed(error);
    }];
}

/**
 *  保存表单数据
 *
 *  @param user
 *  @param success
 *  @param failed
 */
- (void)saveForm:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed{
    
    NSString *path = [BaseHandler requestUrlWithPath:url];
    PrepareExecuteBlock prepareExecute =^(void){
        [AppUtiles showProgressMessage:@"加载中。。。。"];
    };
    
    RTHttpClient *client = [RTHttpClient defaultClient];
    
    [client requestWithPath:path method:RTHttpRequestPost parameters:param prepareExecute:prepareExecute success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        failed(error);
    }];
    
}

@end
