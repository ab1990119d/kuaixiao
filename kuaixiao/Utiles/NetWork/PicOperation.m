//
//  PicOperation.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/12.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "PicOperation.h"

#define NOTIFY_AND_LEAVE(X) {[self cleanup:X]; return;}
#define DATA(X) [X dataUsingEncoding:NSUTF8StringEncoding]

// Posting constants
#define IMAGE_CONTENT @"Content-Disposition: form-data; name=\"%@\"; fileName=\"image.jpg\"\r\n Content-Type: image/jpeg/file\r\n\r\n"
#define STRING_CONTENT @"Content-Disposition: form-data; name=\"%@\"\r\n\r\n"
#define MULTIPART @"multipart/form-data; boundary=------------0x0x0x0x0x0x0x0x"

@implementation PicOperation

//创建postdata
- (NSData*)generateFormDataFromPostDictionary:(NSDictionary*)dict
{
    id boundary = @"------------0x0x0x0x0x0x0x0x";
    NSArray* keys = [dict allKeys];
    NSMutableData* result = [NSMutableData data];
    
    for (int i = 0; i < [keys count]; i++)
    {
        id value = [dict valueForKey: [keys objectAtIndex:i]];
        [result appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        if ([value isKindOfClass:[NSData class]])
        {
            // handle image data
            NSString *formstring = [NSString stringWithFormat:IMAGE_CONTENT, [keys objectAtIndex:i]];
            [result appendData: DATA(formstring)];
            [result appendData:value];
        }
        else
        {
            // all non-image fields assumed to be strings
            NSString *formstring = [NSString stringWithFormat:STRING_CONTENT, [keys objectAtIndex:i]];
            [result appendData: DATA(formstring)];
            [result appendData:DATA(value)];
        }
        
        NSString *formstring = @"\r\n";
        [result appendData:DATA(formstring)];
    }
    
    NSString *formstring =[NSString stringWithFormat:@"--%@--\r\n", boundary];
    [result appendData:DATA(formstring)];
    return result;
}

//上传图片
- (NSDictionary *) UpLoading:(NSData *) data
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyyMMddHHmmss";
    
    NSString *str = [formatter stringFromDate:[NSDate date]];
    
    NSString *name = [NSString stringWithFormat:@"%@.png", str];
    
    
    NSMutableDictionary* post_dict = [[NSMutableDictionary alloc] init];
    
    [post_dict setObject:name forKey:@"fileName"];

    [post_dict setObject:data forKey:@"file"];
    
    NSData *postData = [self generateFormDataFromPostDictionary:post_dict];

    NSString * baseurl = [NSString stringWithFormat:@"%@/file/upload2.do",MAINURL];
    NSURL *url = [NSURL URLWithString:baseurl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];

    [urlRequest setHTTPMethod: @"POST"];
    [urlRequest setValue:MULTIPART forHTTPHeaderField: @"Content-Type"];
    [urlRequest setHTTPBody:postData];
    
    // Submit & retrieve results
    NSError *error;
    NSURLResponse *response;
    NSLog(@"Contacting TwitPic....");
    NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    if (!result)
    {
       return nil;
    }
    // Return result
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end