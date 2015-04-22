//
//  NetWorkUtil.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/4.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "NetWorkUtil.h"

@implementation NetWorkUtil

+(AFHTTPRequestOperationManager *)getManager{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 3.0f;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    
    
    return manager;
}


+ (void)uploadFile:(NSString*) fileName
{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyyMMddHHmmss";
    
    NSString *str = [formatter stringFromDate:[NSDate date]];
    
    NSString *name = [NSString stringWithFormat:@"%@.png", str];
    
    
    NSDictionary *parameters = @{@"fileName":name};
    
//    NSArray *fileArr  = [fileName componentsSeparatedByString:@"."];
//    
    NSString * urlStr = [NSString stringWithFormat:@"%@/file/upload2.do",MAINURL];
    
    AFHTTPRequestOperationManager *manager = [NetWorkUtil getManager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileArr objectAtIndex:0] ofType:[fileArr objectAtIndex:1]];
//        
        NSData *data=[NSData dataWithContentsOfFile:fileName];
        //上传时使用当前的系统事件作为文件名

        //服务器上传文件的字段和类型
        
        [formData appendPartWithFileData:data name:@"file" fileName:name mimeType:@"image/jpg/file"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *result = responseObject;
        
        NSString *msg = [result valueForKey:@"filePath"];
        
        
        NSLog(@"图片上传成功返回路径－－－－－－－－%@",msg);
        
       // [KuaiXiaoTool showAlert:@"上传成功！"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        CLog(@"error---------%@",error);
        [KuaiXiaoTool showAlert:@"数据请求失败！"];
    }];
    
}

+(void)downFile:(NSString *)filePath
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *Amanager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    NSString *urlString = filePath;
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [Amanager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        // 指定下载文件保存的路径
        //        NSLog(@"%@ %@", targetPath, response.suggestedFilename);
        // 将下载文件保存在缓存路径中
        NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *path = [cacheDir stringByAppendingPathComponent:response.suggestedFilename];
        
        // URLWithString返回的是网络的URL,如果使用本地URL,需要注意
        NSURL *fileURL1 = [NSURL URLWithString:path];
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        
        NSLog(@"== %@ |||| %@", fileURL1, fileURL);
        
        return fileURL;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"%@ %@", filePath, error);
    }];
    

}

+(NSData *)down:(NSString *)filePath{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",DOWNLOADURL,filePath];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSError *error = nil;
    NSData   *data = [NSURLConnection sendSynchronousRequest:request
                                           returningResponse:nil
                                                       error:&error];
    /* 下载的数据 */
    if (data != nil){
        NSLog(@"下载成功");
    } else {
        NSLog(@"%@", error);
    }
    
    return data;
}


-(void)load:(NSString *)filePath{
//    
//    NSString *urlString = [NSString stringWithFormat:@"%@/%@",DOWNLOADURL,filePath];;
//    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSArray *filesToUpload =nil;
//    NSString * urlStr = [NSString stringWithFormat:@"%@/file/upload2.do",MAINURL];
//
//
//    NSMutableArray *mutableOperations = [NSMutableArray array];
//    for (NSURL *fileURL in filesToUpload) {
//        NSURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            
//            NSData *data=[NSData dataWithContentsOfFile:fileName];
//            //上传时使用当前的系统事件作为文件名
//            
//            //服务器上传文件的字段和类型
//            
//            [formData appendPartWithFileData:data name:@"file" fileName:name mimeType:@"image/jpg/file"];
//        }];
//        
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        
//        [mutableOperations addObject:operation];
//    }
//    
//    NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:mutableOperations progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
//        NSLog(@"%lu of %lu complete", numberOfFinishedOperations, totalNumberOfOperations);
//    } completionBlock:^(NSArray *operations) {
//        NSLog(@"All operations in batch complete");
//    }];
//    [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
}


@end
