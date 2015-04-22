//
//  CommonHandler.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/18.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//  通用网络通信

#import "BaseHandler.h"
#import "RTHttpClient.h"
#import "AppUtiles.h"

@interface CommonHandler : BaseHandler

@property (nonatomic ,strong)RTHttpClient *client;

/**
 *  向服务器提交数据
 *  @param 需要传递的参数
 *  @param 对应的URL
 *  @param 请求成功时的返回块
 *  @param 请求失败时的返回块
 */
- (void) requestData:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 *  下载数据
 *  @param user
 *  @param success
 *  @param failed
 */



/**
 *  上传数据
 *  @param user
 *  @param success
 *  @param failed
 */
-(void)uploadData:(NSData *)data success:(SuccessBlock)success failed:(FailedBlock)failed completion:(CompleteBlock)completion;

@end
