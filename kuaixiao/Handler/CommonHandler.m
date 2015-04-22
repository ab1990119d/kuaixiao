//
//  CommonHandler.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/18.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "CommonHandler.h"

@implementation CommonHandler

- (id)init{
    if (self = [super init]){
        _client = [[RTHttpClient alloc]init];;
    }
    return self;
}

- (void) requestData:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed{
    
    NSString *path = [BaseHandler requestUrlWithPath:url];
    PrepareExecuteBlock prepareExecute =^(void){
        [AppUtiles showProgressMessage:@"加载中。。。。"];
    };
    
      [_client requestWithPath:path method:RTHttpRequestPost parameters:param prepareExecute:prepareExecute success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        failed(error);
    }];
    
}


-(void)uploadData:(NSData *)data success:(SuccessBlock)success failed:(FailedBlock)failed completion:(CompleteBlock)completion{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyyMMddHHmmss";
    
    NSString *str = [formatter stringFromDate:[NSDate date]];
    
    NSString *name = [NSString stringWithFormat:@"%@.png", str];
    
    NSDictionary *parameters = @{@"fileName":name};
    NSString * urlStr = [NSString stringWithFormat:@"%@/file/upload2.do",MAINURL];
    
    PrepareExecuteBlock prepareExecute =^(void){
        [AppUtiles showProgressMessage:@"加载中。。。。"];
    };
    
    [_client uploadWithPath:urlStr parameters:parameters prepareExecute:prepareExecute constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:name mimeType:@"image/jpg/file"];
    } success:^(NSURLSessionDataTask *operation, id responseObject) {
        success(responseObject);
        completion();
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        failed(error);
    }completion:^{
       
    }];
}


-(void)upload{
}


@end
