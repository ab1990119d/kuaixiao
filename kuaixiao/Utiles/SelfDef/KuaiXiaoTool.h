//
//  KuaiXiaoTool.h
//  kuaixiao
//
//  Created by 邹克鹏 on 14/11/21.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KuaiXiaoTool : NSObject
+(void)showAlert:(NSString*)alertString;
+(NSString *)lastStringWithString:(NSString *)str;
+(NSString *)jiDuWithMonth:(NSInteger)jiDu;
+ (NSArray *)pickViewArray;
+(NSString *)stringTOjson:(id)temps;   //把字典和数组转换成json字符串
/*
 
 把2014年4季度 转化为服务器要求的格式

 */
+(NSString *)postStrWithString:(NSString *)str;
@end
