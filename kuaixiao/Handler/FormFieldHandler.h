//
//  FormFieldHandler.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/18.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "BaseHandler.h"
#import "RTHttpClient.h"
#import "AppUtiles.h"

@interface FormFieldHandler : BaseHandler

/**
 *  保存表单数据
 *
 *  @param user
 *  @param success
 *  @param failed
 */
- (void)saveForm:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed;


/**
 *  加载表单数据
 *
 *  @param user
 *  @param success
 *  @param failed
 */
- (void)loadForm:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed;



@end
